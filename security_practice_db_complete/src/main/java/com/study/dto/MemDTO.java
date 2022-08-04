package com.study.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemDTO implements Serializable{
//   private String mem_id;
//   private String grade_id;
//   private String company_id;
//   private String dept_id;
//   private String mem_name;
//   private String mem_phone;
//   private String mem_mail;
//   private String mem_gender;
//   private String mem_birth;
//   private String mem_addr;
//   private int mem_sal;
//   private String mem_pwd;
//   private String mem_con_start;
//   private String mem_con_end;
//   private String mem_dcon_start;
//   private String mem_dcon_end;
//   private boolean enabled;
   
   
   // 태현
   @NotNull
    private String mem_id;
   
   @NotNull
    private String grade_id;
   
    private String company_id;
    
    private String dept_id;
    
    @NotNull
    private String mem_name;
    
    @NotNull
//    @Size(min=15,max=15)
    @Pattern(regexp = "^01(?:0|1|[6-9])-(?:[0-9]{3}|[0-9]{4})-[0-9]{4}$", message="대시(-)를 포함해 휴대전화 번호를 적어주세요")
    private String mem_phone;
    
    @NotNull
    @Email(message="이메일 형식이 정확하지 않습니다")
    private String mem_mail;
    
    @NotNull
    private String mem_gender;
   
    @NotNull
    @Past(message="날짜를 다시 확인해주세요")
//    @Pattern(regexp = "^(?:[]|(?:1|2)[0-9]{3}-(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9]|3[01]))$", message="날짜 입력 형식이 잘못됐습니다 (YYYY-MM-DD 형식으로 작성)")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date mem_birth;
   
    @NotNull
    private String mem_addr;
    
    @NotNull
//    @Pattern(regexp = "[0-9]+", message="숫자로만 입력해주세요")
    private int mem_sal;
    
    @NotNull
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$", message="비밀번호는 영문과 특수문자 숫자를 포함하며 8자리 이상, 20자리 이하여야 합니다.")
    private String mem_pwd;
   
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date mem_con_start;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date mem_con_end;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date mem_dcon_start;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date mem_dcon_end;
    
    private boolean enabled;
   
   
   // 직원 권한 정보 => 권한을 여러개 담기 위해 리스트로 담아서 가지고 있는 것인데
   // 우리는 한 사람 당 ROLE_USER 만 필요하기 때문에 리스트까진 필요 없지만
   // 리스트로 해도 상관없기 때문에 해볼 예정
   private List<AuthorityDTO> authorities;
}