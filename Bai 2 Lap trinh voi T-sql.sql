--2.1
BEGIN
	DECLARE @a int = 5;
	DECLARE @b int = 4;
    DECLARE @cong int;
	DECLARE @tru int;
	DECLARE @nhan int;
	DECLARE @chia int;
	PRINT N'Số a =' + CAST(@a as varchar(15));
	PRINT N'Số b =' + CAST(@b as varchar(15));
	SET @cong = @a + @b;
	SET @tru = @a - @b;
	SET @nhan = @a * @b;
	SET @chia = @a / @b;
	PRINT N'Cộng =' + CAST(@cong as varchar(15));
	PRINT N'Trừ =' + CAST(@tru as varchar(15));
	PRINT N'Nhân =' + CAST(@nhan as varchar(15));
	PRINT N'Chia =' + CAST(@chia as varchar(15));

END;
--2.2
BEGIN 
	DECLARE @thanghientai int;
	DECLARE @quyhientai int;

	SET @thanghientai = MONTH(GETDATE())

	IF @quyhientai >= 1 and @quyhientai <=3
		 SET @quyhientai = 1;
	ELSE IF @quyhientai >= 4 and @quyhientai <=6
		 SET @quyhientai = 2;
	ELSE IF @quyhientai >= 7 and @quyhientai <=9
		 SET @quyhientai = 3;
	ELSE 
		 SET @quyhientai =4;

	PRINT N'Tháng hiện tại: ' + CAST(@thanghientai as varchar(15));
	PRINT N'Quý hiện tại: ' + CAST(@quyhientai as varchar(15));
END;
--2.3
BEGIN
	DECLARE @n int = 5;
	DECLARE @S1 int = 0;
	DECLARE @i int = 1;
	DECLARE @S2 float = 0;

	WHILE (@i <= @n)
		BEGIN
			SET @s1 = @S1 + @i;
			SET @s2 = @S2 + 1/@i;
			SET @i = @i +1;
		END;
	PRINT N'Tổng của S1 là: ' + CAST(@S1 as varchar(15));
	PRINT N'Tổng của S2 là: ' + CAST(@S2 as varchar(15));
END;
--2.4
BEGIN
	DECLARE @noisinh nvarchar(250) = N'TT Huế';
	DECLARE @masinhvien nvarchar(10);
	DECLARE @hodem nvarchar(45);
	DECLARE @ten nvarchar(15);
	DECLARE @ngaysinh date;

	SELECT 
		@masinhvien = s.masinhvien,
		@hodem = s.hodem,
		@ten = s.ten,
		@ngaysinh = s.ngaysinh
	FROM SINHVIEN s
	WHERE s.noisinh = @noisinh;

	PRINT N'Mã sinh viên: ' + @masinhvien;
	PRINT N'Họ đệm: ' + @hodem;
	PRINT N'Tên: ' + @ten;
	PRINT N'Ngày sinh: ' + CAST(@ngaysinh as varchar(15));
END;