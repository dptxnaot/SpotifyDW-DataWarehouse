# Kho Dữ Liệu Spotify 2023

## Giới thiệu
Xây dựng kho dữ liệu phân tích âm nhạc Spotify 2023 
Sử dụng Star Schema, SSIS ETL và SSAS Cube.

## Công nghệ sử dụng
- SQL Server 2019
- SSIS (Visual Studio 2022)
- SSAS Multidimensional
- MDX Query

## Cấu trúc project
- SpotifyETL/: SSIS Package
- SpotifyCube/: SSAS Project
- Database/: Script SQL tạo bảng
- Data/: File CSV nguồn

## Hướng dẫn chạy
1. Restore SpotifyDW.bak vào SQL Server
2. Mở SpotifyETL.sln → sửa Connection String → F5
3. Mở SpotifyCube.sln → Deploy
4. Mở SSMS → New MDX Query → truy vấn
