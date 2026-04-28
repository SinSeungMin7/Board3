package com.green.user.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.green.user.dto.UserDto;

@Mapper
public interface UserMapper {

	List<UserDto> getUserList();

	void insertUser(UserDto userDto);

	void deleteUser(UserDto userdto);

	void updateUser(UserDto userDto);

	UserDto getUser(UserDto userDto);


}