import { CommonConstants } from '../common/constants/CommonConstants';
import { ListItemData } from '../common/bean/ListItemData';
import { TabItemData } from '../common/bean/TabItemData';
import { ListDataSource } from './ListDataSource';

/**
 * Binds data to components and provides interfaces.
 */
export class PageViewModel {
  /**
   * 获取底部导航配置
   *
   * @return {Array<TabItemInfo>} tabItems
   */
  getTabData(): Array<TabItemData> {
    let tabTitles: Array<string | Resource> = [$r("app.string.tab_feed"), $r("app.string.tab_video"), '发现', '消息', '我的']
    let tabItems: Array<TabItemData> = [];
    for (let i = 0; i < tabTitles.length; i++) {
      let tabItem: TabItemData = new TabItemData();
      tabItem.index = i;
      tabItem.imageOriginal = $r('app.media.ic_normal');
      tabItem.imageActivated = $r('app.media.ic_activated');
      tabItem.title = tabTitles[i];
      tabItems.push(tabItem);
    }
    return tabItems;
  }

  /**
   * Get data sources required by the LazyForEach interface.
   *
   * @return {ListDataSource} new ListDataSource(listItems)
   */
  getListDataSource(): ListDataSource {
    let listItems: Array<ListItemData> = [];
    for (let i = 0; i < CommonConstants.LIST_SIZE; i++) {
      let itemInfo: ListItemData = new ListItemData();
      itemInfo.image = $r('app.media.ic_normal');
      itemInfo.title = $r('app.string.list_item_title');
      itemInfo.subTitle = $r('app.string.list_item_sub_title');
      itemInfo.summary = $r('app.string.list_item_summary');
      itemInfo.rightArrowImage = $r('app.media.ic_right_arrow');
      listItems.push(itemInfo);
    }
    return new ListDataSource(listItems);
  }

  /**
   * Get detail list Data.
   *
   * @return {Array<ListItemData>} listItems
   */
  getDetailListData(): Array<ListItemData> {
    let listItems: Array<ListItemData> = [];
    for (let i = 0; i < 4; i++) {
      let itemInfo: ListItemData = new ListItemData();
      itemInfo.title = $r('app.string.detail_page_list_title');
      itemInfo.summary = $r('app.string.list_item_summary');
      listItems.push(itemInfo);
    }
    return listItems;
  }
}

let pageViewModel = new PageViewModel();

export default pageViewModel as PageViewModel;