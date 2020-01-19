var open_popup = function (popup_nm, opacity, type_nm, position_x, position_y, modalclose) {
    if (!opacity) {
        opacity = 0.3;
    }
    if (popup_nm && type_nm && !position_x && !position_y && !modalclose) {
        $('.' + popup_nm).bPopup({
            modalClose: false,
            opacity: opacity,
            positionStyle: type_nm
        });
    }
    else if (popup_nm && type_nm && position_x && position_y && !modalclose) {
        $('.' + popup_nm).bPopup({
            modalClose: false,
            follow: [false, false],
            position: [position_x, position_y]
        });
    }
    else if (popup_nm && !type_nm && !position_x && !position_y && !modalclose) {
        $('.' + popup_nm).css('display', 'block');
    }
    else if (popup_nm && !type_nm && !position_x && !position_y && modalclose == false) {
        $('.' + popup_nm).bPopup({
            modalClose: modalclose,
            opacity: opacity,
            positionStyle: type_nm
        });
    }
};
var closed_popup = function (popup_nm) {
    $('.' + popup_nm).bPopup().close();
};
var closed_popup2 = function (popup_nm) {
    $('.' + popup_nm).css('display', 'none');
};
var chklen = function (in1, in2, len) {
    var in1 = $('#' + in1).val();
    var iLeng = in1.length;
    if (iLeng == len) {
        $('#' + in2).focus();
    }
    else {
        return false;
    }
};
//# sourceMappingURL=common.top.js.map