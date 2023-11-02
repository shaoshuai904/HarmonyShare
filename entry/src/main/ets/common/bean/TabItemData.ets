/**
 * Tab item data entity.
 */
export class TabItemData {
  /**
   * Tab index.
   */
  index: number = 0;
  /**
   * Tab 默认icon.
   */
  imageOriginal: Resource = $r('app.media.ic_normal');
  /**
   * Tab 选中icon.
   */
  imageActivated: Resource = $r('app.media.ic_activated');
  /**
   * Tab title.
   */
  title: string | Resource = ''; // $r('app.string.tab_title');
}