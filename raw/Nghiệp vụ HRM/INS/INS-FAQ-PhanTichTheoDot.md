# INS FAQ — Phân Tích BH Theo Đợt

## Khái niệm
1 tháng có thể phân tích **nhiều lần**, mỗi lần là 1 đợt. Dùng khi dữ liệu thay đổi giữa tháng (lương thay đổi, NV mới vào...).

## Cấu hình
- Thiết lập BH > **"Phân tích BH theo đợt"** (`IsUseInsAnalyzePeriod`) — nếu không check thì ẩn control đợt

## Logic lưu dữ liệu

### Đợt 1
- Xử lý như phân tích bình thường, lưu dòng mới với `Period = 1`

### Đợt 2 trở đi
So sánh số tiền đóng BH (`SocialInsEmpAmount`, `HealthInsEmpAmount`, `UnemployEmpAmount`) với dòng liền trước cùng tháng:
- **Không thay đổi** → không lưu dòng mới, chỉ update `IsDecreaseWorkingDays`, `IsPregnant`, `IsQuit` của dòng cũ (nếu có thay đổi)
- **Có thay đổi** → lưu thêm dòng mới với `Period` = đợt hiện tại

## PE hay thắc mắc
Thấy có 2 dòng cùng tháng → giải thích: đợt 2 phân tích lại có số tiền BH thay đổi nên hệ thống lưu thêm dòng mới — đây là logic đúng.
