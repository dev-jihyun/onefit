package com.kh.onefit.home.model.service;

import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.user.model.vo.User;

public interface HomeService {

	User loginUser(User Check);

	Trainer loginTrainer(Trainer checkTrainer);

}
