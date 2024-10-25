package days09;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//인증정보 저장할 class
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthInfo {
	private String id;
	private String name;
	private ArrayList<String> authority;
}
