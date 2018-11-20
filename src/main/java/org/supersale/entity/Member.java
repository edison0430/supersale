package org.supersale.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;

public class Member {

    public interface registerValidation {};

    public interface editValidation {};

    private int memberId;

    @NotEmpty(groups = {registerValidation.class, editValidation.class}, message = "{name}")
    private String name;

    private String gender;

    @Pattern(groups = {registerValidation.class, editValidation.class}, regexp = "^09\\d{8}$", message = "{phone}")
    private String phone;

    @Pattern(groups = {registerValidation.class, editValidation.class}, regexp = "^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$", message = "{email}")
    private String email;

    @Pattern(groups = {registerValidation.class}, regexp = "^(?=.*\\d)(?=.*[a-z]).{6,20}$", message = "{password}")
    private String password;

    private String address;

    private Boolean admin;


    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "Member{" +
                "name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
