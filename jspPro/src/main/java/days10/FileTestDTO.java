package days10;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FileTestDTO {
   
   // table column name == field name
   private int num;                  // 번호는 시퀀스로 자동 증가될거야
   private String subject;           // 제목
   private String filesystemname;    // 시스템파일명, 이건 파일 정보 얻어와야해
   private String originalfilename;  // 오리지널파일명, 이건 파일 정보 얻어와야해
   private long filelength;  // 이건 파일 정보 얻어와야해

}