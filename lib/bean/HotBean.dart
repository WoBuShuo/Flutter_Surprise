class HotBean {
    int id;
    String link;
    String name;
    int order;
    int visible;

    HotBean({this.id, this.link, this.name, this.order, this.visible});

    factory HotBean.fromJson(Map<String, dynamic> json) {
        return HotBean(
            id: json['id'],
            link: json['link'],
            name: json['name'],
            order: json['order'],
            visible: json['visible'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['link'] = this.link;
        data['name'] = this.name;
        data['order'] = this.order;
        data['visible'] = this.visible;
        return data;
    }
}