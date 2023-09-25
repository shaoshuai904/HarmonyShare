/**
 * Tab item data entity.
 */
export class TabItemData {
  /**
   * Original image of the tabs.
   */
  imageOriginal: Resource = $r('app.media.ic_normal');

  /**
   * Active image of the tabs.This image is displayed when you click the tab.
   */
  imageActivated: Resource = $r('app.media.ic_activated');

  /**
   * Tab title.
   */
  title: Resource = $r('app.string.tab_title');
}