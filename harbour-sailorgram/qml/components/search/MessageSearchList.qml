import QtQuick 2.1
import Sailfish.Silica 1.0
import harbour.sailorgram.TelegramQml 2.0
import "../../models"
import "../../items/search"

Item
{
    property Context context
    property alias count: lvsearch.count

    signal messageClicked(var message)

    function resetSearchBox() {
        searchbox.text = "";
    }

    id: searchlist

    height: {
        var h = lvsearch.contentHeight;

        if(searchbox.visible)
            h += searchbox.height;

        return h;
    }

    SearchField
    {
        id: searchbox
        anchors { left: parent.left; right: parent.right }
        visible: context.showsearchfield
        height: visible ? Theme.itemSizeSmall : 0
    }

    SilicaListView
    {
        id: lvsearch
        anchors { left: parent.left; top: searchbox.bottom; right: parent.right; bottom: parent.bottom }
        spacing: Theme.paddingMedium
        clip: true

        model: MessageSearchModel {
            id: searchmodel
            engine: context.engine
            keyword: searchbox.text
        }

        delegate: MessageSearchItem {
            id: searchitem
            contentWidth: parent.width
            contentHeight: Theme.itemSizeSmall
            context: searchlist.context
            message: item
            onClicked: messageClicked(searchitem.message);
        }
    }
}

