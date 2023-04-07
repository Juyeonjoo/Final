ALTER TABLE member ADD CONSTRAINT member_member_level_num_fk FOREIGN KEY (member_level_num) REFERENCES member_act_grade(member_level_num) ON DELETE CASCADE;

ALTER TABLE member ADD CONSTRAINT member_town_id_fk FOREIGN KEY (town_id) REFERENCES town(town_id) ON DELETE CASCADE;

ALTER TABLE non_member ADD CONSTRAINT non_member_town_id_fk FOREIGN KEY (town_id) REFERENCES town(town_id) ON DELETE CASCADE;

ALTER TABLE member_retail_cart ADD CONSTRAINT member_retail_cart_member_id_fk FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE;

ALTER TABLE member_retail_cart ADD CONSTRAINT member_retail_cart_retail_id_fk FOREIGN KEY (retail_id) REFERENCES retail(retail_id) ON DELETE CASCADE;

ALTER TABLE  member_retail_cart ADD CONSTRAINT member_retail_cart_cart_id_fk FOREIGN KEY (cart_id ) REFERENCES cart(cart_id) ON DELETE CASCADE;
