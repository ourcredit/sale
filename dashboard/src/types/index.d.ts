// type definitions for iview 2.5.1
// project: https://github.com/iview/iview
// definitions by: yangdan
// definitions: https://github.com/yangdan8/iview.git
import Vue from "vue";
import { Affix } from "@/types/affix";
import { Alert } from "@/types/alert";
import { AutoComplete } from "@/types/auto-complete";
import { Avatar } from "@/types/avatar";
import { BackTop } from "@/types/back-top";
import { Badge } from "@/types/badge";
import { Breadcrumb, BreadcrumbItem } from "@/types/breadcrumb";
import { Button, ButtonGroup } from "@/types/button";
import { Card } from "@/types/card";
import { Carousel } from "@/types/carousel";
import { Cascader } from "@/types/cascader";
import { Checkbox, CheckboxGroup } from "@/types/checkbox";
import { Circle } from "@/types/circle";
import { Collapse, CollapsePanel } from "@/types/collapse";
import { ColorPicker } from "@/types/color-picker";
import { DatePicker, DatePickerOptions } from "@/types/date-picker";
import { Dropdown, DropdownItem } from "@/types/dropdown";
import { Form, FormItem } from "@/types/form";
import { GridRow, GridCol } from "@/types/grid";
import { Icon } from "@/types/icon";
import { Input } from "@/types/input";
import { InputNumber } from "@/types/input-number";
import { LoadingBarInstance, LoadingBarConfig } from "@/types/loading-bar";
import { Menu, MenuItem, Submenu, MenuGroup } from "@/types/menu";
import { MessageInstance, MessageConfig } from "@/types/message";
import { Modal, ModalInstance, ModalConfig } from "@/types/modal";
import { NoticeInstance, NoticeConfig, NoticeGlobalConfig } from "@/types/notice";
import { Page } from "@/types/page";
import { Poptip } from "@/types/poptip";
import { Progress } from "@/types/progress";
import { Radio, RadioGroup } from "@/types/radio";
import { Rate } from "@/types/rate";
import { Scroll } from "@/types/scroll";
import { Select, SelectOption, SelectOptionGroup } from "@/types/select";
import { Spin } from "@/types/spin";
import { Steps, Step } from "@/types/steps";
import { Switch } from "@/types/switch";
import {
  Table,
  TableColumn,
  TableRenderCreateElementData,
  TableRenderCreateElementResult,
  TableColumnRenderParams,
  TableExportCsvParams
} from "@/types/table";
import { Tabs, TabPane } from "@/types/tabs";
import { Tag } from "@/types/tag";
import { Timeline, TimelineItem } from "@/types/timeline";
import { TimePicker } from "@/types/time-picker";
import { Tooltip } from "@/types/tooltip";
import { Transfer } from "@/types/transfer";
import { Tree, TreeChildren } from "@/types/tree";
import { Upload } from "@/types/upload";

export declare namespace IView {
  interface IAffix extends Affix {}
  interface IAlert extends Alert {}
  interface IAutoComplete extends AutoComplete {}
  interface IAvatar extends Avatar {}
  interface IBackTop extends BackTop {}
  interface IBadge extends Badge {}
  interface IBreadcrumb extends Breadcrumb {}
  interface IBreadcrumbItem extends BreadcrumbItem {}
  interface IButton extends Button {}
  interface IButtonGroup extends ButtonGroup {}
  interface ICard extends Card {}
  interface ICarousel extends Carousel {}
  interface ICascader extends Cascader {}
  interface ICheckbox extends Checkbox {}
  interface ICheckboxGroup extends CheckboxGroup {}
  interface ICircle extends Circle {}
  interface ICollapse extends Collapse {}
  interface ICollapsePanel extends CollapsePanel {}
  interface IColorPicker extends ColorPicker {}
  interface IDatePicker extends DatePicker {}
  interface IDatePickerOptions extends DatePickerOptions {}
  interface IDropdown extends Dropdown {}
  interface IDropdownItem extends DropdownItem {}
  interface IForm extends Form {}
  interface IFormItem extends FormItem {}
  interface IGridCol extends GridCol {}
  interface IGridRow extends GridRow {}
  interface IIcon extends Icon {}
  interface IInput extends Input {}
  interface IInputNumber extends InputNumber {}
  interface ILoadingBarConfig extends LoadingBarConfig {}
  interface ILoadingBarInstance extends LoadingBarInstance {}
  interface IMenu extends Menu {}
  interface IMenuGroup extends MenuGroup {}
  interface IMenuItem extends MenuItem {}
  interface IMessageConfig extends MessageConfig {}
  interface IMessageInstance extends MessageInstance {}
  interface IModal extends Modal {}
  interface IModalConfig extends ModalConfig {}
  interface IModalInstance extends ModalInstance {}
  interface INoticeConfig extends NoticeConfig {}
  interface INoticeGlobalConfig extends NoticeGlobalConfig {}
  interface INoticeInstance extends NoticeInstance {}
  interface IPage extends Page {}
  interface IPoptip extends Poptip {}
  interface IProgress extends Progress {}
  interface IRadio extends Radio {}
  interface IRadioGroup extends RadioGroup {}
  interface IRate extends Rate {}
  interface IScroll extends Scroll {}
  interface ISelect extends Select {}
  interface ISelectOption extends SelectOption {}
  interface ISelectOptionGroup extends SelectOptionGroup {}
  interface ISpin extends Spin {}
  interface IStep extends Step {}
  interface ISteps extends Steps {}
  interface ISubmenu extends Submenu {}
  interface ISwitch extends Switch {}
  interface ITable extends Table {}
  interface ITableColumn extends TableColumn {}
  interface ITableColumnRenderParams extends TableColumnRenderParams {}
  interface ITableExportCsvParams extends TableExportCsvParams {}
  interface ITableRenderCreateElementData
    extends TableRenderCreateElementData {}
  interface ITableRenderCreateElementResult
    extends TableRenderCreateElementResult {}
  interface ITabPane extends TabPane {}
  interface ITabs extends Tabs {}
  interface ITag extends Tag {}
  interface ITimeline extends Timeline {}
  interface ITimelineItem extends TimelineItem {}
  interface ITimePicker extends TimePicker {}
  interface ITooltip extends Tooltip {}
  interface ITransfer extends Transfer {}
  interface ITree extends Tree {}
  interface ITreeChildren extends TreeChildren {}
  interface IUpload extends Upload {}
}
export default IView;
