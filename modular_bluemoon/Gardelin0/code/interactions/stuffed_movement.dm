/proc/activate_after(obj, delay)

	var/endtime = world.time + delay
	. = 1
	while (world.time < endtime)
		stoplag()

//Dildo
/obj/item/dildo/proc/stuffed_movement()
	var/obj/item/organ/genital/G = loc
	var/mob/living/carbon/human/U = G

	spawn()
		while(inside)
			if(activate_after(src, rand(5,60)))
				if(!istype(loc, /obj/item/organ/genital))
					return
				if(prob(25))
					if(dildo_size == 5)
						to_chat(U, span_userdanger(pick("Гигантский дилдо внутри сводит вас с ума!", "Вы чувствуете мучительное удовольствие от гигантского дилдо глубоко внутри!")))
						U.handle_post_sex(HIGH_LUST, null, U)
						U.Jitter(6)
						U.Stun(10)
						U.emote("moan")
					else if(dildo_size == 4)
						to_chat(U, span_userdanger(pick("Огромный дилдо внутри сводит вас с ума!", "Вы чувствуете мучительное удовольствие от огромного дилдо глубоко внутри!")))
						U.handle_post_sex(HIGH_LUST, null, U)
						U.Jitter(3)
						U.Stun(6)
						U.emote("moan")
					else if(!dildo_size == 1)
						to_chat(U, span_love(pick("Дилдо внутри сводит вас с ума!", "Вы чувствуете мучительное удовольствие от дилдо глубоко внутри!")))
						U.handle_post_sex(NORMAL_LUST, null, U)
						U.Jitter(3)
						U.Stun(3)
						U.emote("moan")
					else
						to_chat(U, span_love(pick("Я чувствую дилдо внутри!", "Вы чувствуете удовольствие от дилдо глубоко внутри!")))
						U.handle_post_sex(LOW_LUST, null, U)
						U.do_jitter_animation()

//Buttplug
/obj/item/buttplug/proc/stuffed_movement()
	var/obj/item/organ/genital/G = loc
	var/mob/living/carbon/human/U = G

	spawn()
		while(inside)
			if(activate_after(src, rand(5,60)))
				if(!istype(loc, /obj/item/organ/genital))
					return
				if(prob(25))
					if(buttplug_size == 4)
						to_chat(U, span_userdanger(pick("Огромная затычка внутри сводит вас с ума!", "Вы чувствуете мучительное удовольствие от огромной затычки глубоко внутри!")))
						U.handle_post_sex(HIGH_LUST, null, U)
						U.Jitter(3)
						U.Stun(6)
						U.emote("moan")
					else if(!buttplug_size == 1)
						to_chat(U, span_love(pick("Затычка внутри сводит вас с ума!", "Вы чувствуете мучительное удовольствие от затычки глубоко внутри!")))
						U.handle_post_sex(NORMAL_LUST, null, U)
						U.Jitter(3)
						U.Stun(3)
						U.emote("moan")
					else
						to_chat(U, span_love(pick("Я чувствую анальную затычку внутри!", "Вы чувствуете удовольствие от затычки глубоко внутри!")))
						U.handle_post_sex(LOW_LUST, null, U)
						U.do_jitter_animation()

//Tentacle Panties
/obj/item/clothing/underwear/briefs/tentacle/proc/tentacle_panties(mob/living/carbon/human/M, slot)
	if(!istype(src, M.w_underwear))
		return
	while(istype(src, M.w_underwear))
		if(tired == TRUE)
			if(activate_after(src, rand(500,1000)))
				tired = FALSE

		if(activate_after(src, rand(25 ,50)) && tired == FALSE)
			if(prob(15))
				if(M.has_penis())
					to_chat(M, span_userdanger(pick("Движения в уретре сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции своего члена!")))
				if(M.has_vagina())
					to_chat(M, span_userdanger(pick("Сильные фрикции внутри сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильных фрикций внутри своих дырочек!")))
				M.handle_post_sex(NORMAL_LUST*2, null, M)
				M.Jitter(3)
				M.Stun(30)
				M.emote("moan")
			else
				if(M.has_penis())
					to_chat(M, span_love(pick("Я чувствую что-то у своего члена!", "Оно обсасывает мой член!")))
				if(M.has_vagina())
					to_chat(M, span_love(pick("Я чувствую что-то внутри!", "Оно движется внутри меня!", "Я ощущаю фрикции в своих дырочках!")))
				M.handle_post_sex(NORMAL_LUST, null, M)
				M.do_jitter_animation()
			lust += rand(1 ,10)
			playsound(loc, 'modular_sand/sound/lewd/champ_fingering.ogg', 25, 1, -1)

			if(prob(50) && lust >= 300)
				tired = TRUE
				to_chat(M, span_love(pick("Оно меня обкончало!")))
				visible_message("<font color=purple>Вязкая жидкость вытекает из <b>[src]</b> и стекает по бедрам <b>[M]</b>!</font>")
				M.reagents.add_reagent(/datum/reagent/consumable/semen, 10)
				M.reagents.add_reagent(/datum/reagent/drug/aphrodisiacplus, 5) //Cum contains hexocrocin
				new /obj/effect/decal/cleanable/semen(loc)

/obj/item/magicwand/proc/vibrating(mob/living/carbon/human/M, slot)
	if(!istype(src, M.w_underwear))
		return
	if(!on)
		return

	while(istype(src, M.w_underwear))
		if(activate_after(src, 5))
			switch(mode)
				if(3)
					if(M.has_penis())
						to_chat(M, span_userdanger(pick("Сильная вибрация у члена сводит меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции своего члена!")))
					if(M.has_vagina())
						to_chat(M, span_userdanger(pick("Сильная вибрация у киски сводит меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции своей киски!")))
					M.Jitter(3)
					M.emote("moan")
					M.handle_post_sex(intencity, null, src)
					playsound(loc, pick('modular_bluemoon/Gardelin0/sound/effect/lewd/toys/magicwand3.ogg'), 25, 1)
					if(prob(50))
						M.Stun(5)
				if(2)
					if(M.has_penis())
						to_chat(M, span_love(pick("Я чувствую вибрацию у своего члена!", "Оно вибрирует мой член!")))
					if(M.has_vagina())
						to_chat(M, span_love(pick("Я чувствую вибрацию у своей киски!", "Оно вибрирует мою киску!")))
						M.handle_post_sex(intencity, null, src)
						M.do_jitter_animation()
						playsound(loc, pick('modular_bluemoon/Gardelin0/sound/effect/lewd/toys/magicwand1.ogg',
										'modular_bluemoon/Gardelin0/sound/effect/lewd/toys/magicwand2.ogg'), 25, 1)
				if(1)
					if(M.has_penis())
						to_chat(M, span_love(pick("Я чувствую слабую вибрацию у своего члена!", "Оно слабо вибрирует мой член!")))
					if(M.has_vagina())
						to_chat(M, span_love(pick("Я чувствую слабую вибрацию у своей киски!", "Оно слабо вибрирует мою киску!")))
						M.handle_post_sex(intencity, null, src)
						M.do_jitter_animation()
						playsound(loc, pick('modular_bluemoon/Gardelin0/sound/effect/lewd/toys/devicevibrator1.ogg',
										'modular_bluemoon/Gardelin0/sound/effect/lewd/toys/devicevibrator2.ogg',
										'modular_bluemoon/Gardelin0/sound/effect/lewd/toys/devicevibrator3.ogg'), 25, 1)
