$(function () {

    function setBoxes()
    {
        var figBox = 0
        $('.thumb-list li').each(
            function () {
                if (figBox < $(this).height())
                    figBox = $(this).height()
            })
        $('.thumb-list li').height(figBox)
    }

    $('.thumb-list li img').load(function () {
        setBoxes()
    })

})