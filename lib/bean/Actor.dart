class Actor {
    int actorId;
    String img;
    String name;
    String nameEn;
    String roleImg;
    String roleName;

    Actor({this.actorId, this.img, this.name, this.nameEn, this.roleImg, this.roleName});

    factory Actor.fromJson(Map<String, dynamic> json) {
        return Actor(
            actorId: json['actorId'], 
            img: json['img'], 
            name: json['name'], 
            nameEn: json['nameEn'], 
            roleImg: json['roleImg'], 
            roleName: json['roleName'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['actorId'] = this.actorId;
        data['img'] = this.img;
        data['name'] = this.name;
        data['nameEn'] = this.nameEn;
        data['roleImg'] = this.roleImg;
        data['roleName'] = this.roleName;
        return data;
    }
}