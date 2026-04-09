CREATE DATABASE SpotifyDW;
GO

-- ============================================================
-- DIM_TIME
-- ============================================================
CREATE TABLE Dim_Time (
    TimeKey         INT             PRIMARY KEY,
    FullDate        DATE            NOT NULL,
    Day             INT,
    Month           INT,
    MonthName       VARCHAR(20),
    Quarter         INT,
    Year            INT,
    DayOfWeek       VARCHAR(15),
    IsWeekend       BIT
);

-- ============================================================
-- DIM_TRACK
-- ============================================================
CREATE TABLE Dim_Track (
    TrackKey            INT             PRIMARY KEY IDENTITY(1,1),
    TrackName           NVARCHAR(500)   NOT NULL,
    ReleasedYear        INT,
    ReleasedMonth       INT,
    ReleasedDay         INT,
    InSpotifyPlaylists  INT,
    InSpotifyCharts     INT
);

-- ============================================================
-- DIM_ARTIST
-- ============================================================
CREATE TABLE Dim_Artist (
    ArtistKey       INT             PRIMARY KEY IDENTITY(1,1),
    ArtistName      NVARCHAR(500)   NOT NULL,
    ArtistCount     INT,
    IsCollab        BIT
);

-- ============================================================
-- DIM_AUDIOFEATURE
-- ============================================================
CREATE TABLE Dim_AudioFeature (
    AudioFeatureKey         INT         PRIMARY KEY IDENTITY(1,1),
    BPM                     INT,
    [Key]                   VARCHAR(5),
    Mode                    VARCHAR(10),
    Danceability_Pct        INT,
    Valence_Pct             INT,
    Energy_Pct              INT,
    Acousticness_Pct        INT,
    Instrumentalness_Pct    INT,
    Liveness_Pct            INT,
    Speechiness_Pct         INT,
    BPM_Group               VARCHAR(20)
);

-- ============================================================
-- DIM_PLATFORM
-- ============================================================
CREATE TABLE Dim_Platform (
    PlatformKey         INT     PRIMARY KEY IDENTITY(1,1),
    InApplePlaylists    INT,
    InAppleCharts       INT,
    InDeezerPlaylists   INT,
    InDeezerCharts      INT,
    InShazamCharts      INT,
    IsOnAllPlatforms    BIT
);

-- ============================================================
-- FACT_STREAMACTIVITY (tạo SAU CÙNG)
-- ============================================================
CREATE TABLE Fact_StreamActivity (
    StreamKey           INT     PRIMARY KEY IDENTITY(1,1),
    TrackKey            INT     NOT NULL FOREIGN KEY REFERENCES Dim_Track(TrackKey),
    ArtistKey           INT     NOT NULL FOREIGN KEY REFERENCES Dim_Artist(ArtistKey),
    TimeKey             INT     NOT NULL FOREIGN KEY REFERENCES Dim_Time(TimeKey),
    AudioFeatureKey     INT     NOT NULL FOREIGN KEY REFERENCES Dim_AudioFeature(AudioFeatureKey),
    PlatformKey         INT     NOT NULL FOREIGN KEY REFERENCES Dim_Platform(PlatformKey),
    Streams             BIGINT,
    ArtistCount         INT
);

-- Kiểm tra kết quả
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';