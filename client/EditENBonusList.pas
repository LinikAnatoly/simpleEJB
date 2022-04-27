
unit EditENBonusList;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBonusListController, ExtCtrls,
  AdvObj ;

type
  TfrmENBonusListEdit = class(TDialogForm)
    PageControl1: TPageControl;
    tsBonus: TTabSheet;
    tsBonusItem: TTabSheet;
    lblNumberGen: TLabel;
    edtNumberGen: TEdit;
    lblMonthGen: TLabel;
    lblYearGen: TLabel;
    HTTPRIOENBonusList: THTTPRIO;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    lblEPRenName: TLabel;
    edtDepartment: TEdit;
    spbEPRen: TSpeedButton;
    RadioGroup1: TRadioGroup;
    rbFinworkerKindTech: TRadioButton;
    rbFinworkerKindZbut: TRadioButton;
    HTTPRIOENDepartment: THTTPRIO;
    ActionList1: TActionList;
    actItemsView: TAction;
    actItemsInsert: TAction;
    actItemsDelete: TAction;
    actItemsEdit: TAction;
    actItemsUpdate: TAction;
    actItemsFilter: TAction;
    actItemsNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ImageList1: TImageList;
    sgENBonusListItem: TAdvStringGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    HTTPRIOENBonusListItem: THTTPRIO;
    lblCode: TLabel;
    edtCode: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    actSetInvalidItem: TAction;
    N5: TMenuItem;
    miSetInvalidItem: TMenuItem;
    actUnSetInvalidItem: TAction;
    miUnSetInvalidItem: TMenuItem;
    actPrintBonusListTechPersonalOnly: TAction;
    N9: TMenuItem;
    miPrintBonusListTechPersonalOnly: TMenuItem;
    rbFinworkerKindZbutController: TRadioButton;
    rbFinworkerKindZbutInspektor: TRadioButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEPRenClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure actItemsViewExecute(Sender: TObject);
    procedure actItemsInsertExecute(Sender: TObject);
    procedure actItemsDeleteExecute(Sender: TObject);
    procedure actItemsEditExecute(Sender: TObject);
    procedure actItemsUpdateExecute(Sender: TObject);
    procedure sgENBonusListItemDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSetInvalidItemExecute(Sender: TObject);
    procedure actUnSetInvalidItemExecute(Sender: TObject);
    procedure actPrintBonusListTechPersonalOnlyExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBonusListEdit: TfrmENBonusListEdit;
  ENBonusListObj: ENBonusList;
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;

    ENBonusListItemHeaders: array [1..21] of String =
        ( 'Код'
          ,'Код підрозділу'
          ,'Назва підрозділу'
          ,'ПІБ'
          ,'Табельний номер'
          ,'Посада'
          ,'Фонд робочого часу за звітний місяць для робітника'
          ,'Фонд робочого часу з урахуванням невиходів'//'Кількість годин, які повинні відпрацювати електромонтери за місяць з урахуванням невиходів'
          ,'Робота з персоналом'//'Робота з персоналом, 5% від кількості годин, які повинні відпрацювати електромонтери з урахуванням невиходів "'
          ,'Час на проїзд'//'Витрати часу на проїзд по всім видам робіт'
          ,'Відпрацьовано часу планові роботи'//'Кількість відпрацьованого часу при виконанні планових робіт'
          ,'Відпрацьовано часу непланові роботи'//'Кількість відпрацьованого часу при виконанні непланових робіт'
          ,'Відпрацьовано часу виробн. характеру '//'Кількість годин відрацьованих виконувачем робіт виробничого характеру '
          ,'% завантаження монтерів'//'Відсоток завантаженості електромонтерів на роботах виробничого характеру'
          ,'% завантаження монтерів, планові роботи'//'Відсоток завантаженості електромонтерів на планових роботах'
          ,'% завантаження монтерів, непланові роботи'//'Відсоток завантаженості електромонтерів на не планових роботах'
          ,'% премії' //'Відсоток премії відповідно до шкали заватаження виконувача робіт виробничого характеру'
          ,'Коеф. викон. планів '//'Коефіцієнт виконання планів за звітний місяць'
          ,'% премії по Положенню'//'Розмір премії для нарахування відповідно до Положення'
          ,'Відпрацьовані дні'//'Фактична кількість відпрацьованих днів'
          ,'Причина по якій строка відомості була позначена як недійсна'
        );
        ENBonusListItemHeadersNew: array [1..23] of String =
        ( 'Код'
          ,'Код підрозділу'
          ,'Назва підрозділу'
          ,'ПІБ'
          ,'Табельний номер'
          ,'Посада'
          ,'Фонд робочого часу за звітний місяць для робітника'
          ,'Фонд робочого часу з урахуванням невиходів'//'Кількість годин, які повинні відпрацювати електромонтери за місяць з урахуванням невиходів'
          ,'Робота з персоналом'//'Робота з персоналом, 5% від кількості годин, які повинні відпрацювати електромонтери з урахуванням невиходів "'
          ,'Час на проїзд'//'Витрати часу на проїзд по всім видам робіт'
          ,'Відпрацьовано часу планові роботи'//'Кількість відпрацьованого часу при виконанні планових робіт'
          ,'Відпрацьовано часу непланові роботи'//'Кількість відпрацьованого часу при виконанні непланових робіт'
          ,'Відпрацьовано часу виробн. характеру '//'Кількість годин відрацьованих виконувачем робіт виробничого характеру '
          ,'% завантаження монтерів'//'Відсоток завантаженості електромонтерів на роботах виробничого характеру'
          ,'% завантаження монтерів, планові роботи'//'Відсоток завантаженості електромонтерів на планових роботах'
          ,'% завантаження монтерів, непланові роботи'//'Відсоток завантаженості електромонтерів на не планових роботах'
          ,'% премії' //'Відсоток премії відповідно до шкали заватаження виконувача робіт виробничого характеру'
          ,'Коеф. викон. планів '//'Коефіцієнт виконання планів за звітний місяць'
          ,'Розмір компенсації за недотримання гарантованих стандартів якості надання послуг, тис.грн.(з ПДВ)'
          ,'Коефіцієнт дотримання гарантованих стандартів якості надання послуг ОСР'
          ,'% премії по Положенню'//'Розмір премії для нарахування відповідно до Положення'
          ,'Відпрацьовані дні'//'Фактична кількість відпрацьованих днів'
          ,'Причина по якій строка відомості була позначена як недійсна'
        );

        ENBonusListItemHeadersZbyt: array [1..20] of String =
        ( 'Код'
          ,'Код підрозділу'
          ,'Назва підрозділу'
          ,'ПІБ'
          ,'Табельний номер'
          ,'Посада'
          ,'Фонд робочого часу за звітний місяць для робітника'
          ,'Фонд робочого часу з урахуванням невиходів'//'Кількість годин, які повинні відпрацювати електромонтери за місяць з урахуванням невиходів'
          ,'Робота з персоналом'//'Робота з персоналом, 5% від кількості годин, які повинні відпрацювати електромонтери з урахуванням невиходів "'
          ,'Час на проїзд'//'Витрати часу на проїзд по всім видам робіт'
          ,'Відпрацьовано часу планові роботи'//'Кількість відпрацьованого часу при виконанні планових робіт'
          ,'Відпрацьовано часу по заявк. споживач.'//'Кількість відпрацьованого часу при виконанні непланових робіт'
          ,'Відпрацьовано часу виробн. характеру '//'Кількість годин відрацьованих виконувачем робіт виробничого характеру '
          ,'% завантаження монтерів'//'Відсоток завантаженості електромонтерів на роботах виробничого характеру'
          ,'% завантаження монтерів, планові роботи'//'Відсоток завантаженості електромонтерів на планових роботах'
          ,'% завантаження за заявк. та розпорядж.'//'Відсоток завантаженості електромонтерів на не планових роботах'
          ,'% премії по шкалі завантаж.' //'Відсоток премії відповідно до шкали заватаження виконувача робіт виробничого характеру'
          ,'Коеф. викон. планів '//'Коефіцієнт виконання планів за звітний місяць'
          ,'% премії по Положенню'//'Розмір премії для нарахування відповідно до Положення'
          ,'Відпрацьовані дні'//'Фактична кількість відпрацьованих днів'
        );
        ENBonusListItemHeadersZbytNew: array [1..22] of String =
        ( 'Код'
          ,'Код підрозділу'
          ,'Назва підрозділу'
          ,'ПІБ працівника(виконувача робіт)'
          ,'Таб. №'
          ,'Посада працівника(виконувача робіт)'
          ,'Фонд робочого часу за звітний місяць для працівника'
          ,'Фонд робочого часу з урахуванням невиходів'//'Кількість годин, які повинні відпрацювати електромонтери за місяць з урахуванням невиходів'
          ,'Робота з персоналом 5%'//'Робота з персоналом, 5% від кількості годин, які повинні відпрацювати електромонтери з урахуванням невиходів "'
          ,'Витрати часу на проїзд'//'Витрати часу на проїзд по всім видам робіт'
          ,'Відпрацьовано часу планові роботи'//'Кількість відпрацьованого часу при виконанні планових робіт'
          ,'Відпрацьовано часу непланові роботи'//'Кількість відпрацьованого часу при виконанні непланових робіт'
          ,'Відпрацьовано часу виробн. характеру '//'Кількість годин відрацьованих виконувачем робіт виробничого характеру '
          ,'% завантаження працівника'//'Відсоток завантаженості електромонтерів на роботах виробничого характеру'
          ,'% завантаження працівника, планові роботи'//'Відсоток завантаженості працівника на планових роботах'
          ,'% завантаження працівника, непланові роботи'//'Відсоток завантаженості працівника на не планових роботах'
          ,'% премії по шкалі заваснтаж.' //'Відсоток премії відповідно до шкали заватаження виконувача робіт виробничого характеру'
          ,'Коеф. викон. планів '//'Коефіцієнт виконання планів за звітний місяць'
          ,'Розмір компенсації за недотримання гарантованих стандартів якості надання послуг, тис.грн.(з ПДВ)'
          ,'Коефіцієнт дотримання гарантованих стандартів якості надання послуг ОСР'
          ,'% премії по Положенню'//'Розмір премії для нарахування відповідно до Положення'
          ,'Відпрацьовані дні'//'Фактична кількість відпрацьованих днів'
        );

implementation

uses ShowENDepartment, ENDepartmentController, ENConsts, FINWorkerController,
  FINWorkerKindController, ENBonusListItemController, EditENBonusListItem,
  DMReportsUnit;


{uses  
    EnergyproController, EnergyproController2, ENBonusListController  ;
}
{$R *.dfm}



procedure TfrmENBonusListEdit.FormShow(Sender: TObject);
  var
   TempENDepartment: ENDepartmentControllerSoapPort;
begin

  PageControl1.ActivePageIndex := 0;

  DisableControls([edtCode , edtDepartment]);

  if DialogState = dsView then
  begin
     DisableControls([edtNumberGen ,  edtMonthGen , edtYearGen  , spbEPRen , rbFinworkerKindTech  , rbFinworkerKindZbut
       , rbFinworkerKindZbutController , rbFinworkerKindZbutInspektor ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtMonthGen
      ,edtYearGen
     ]);
   end;

  if (DialogState = dsEdit) then
  begin
   DisableControls([edtMonthGen , edtYearGen  , spbEPRen , rbFinworkerKindTech  , rbFinworkerKindZbut , rbFinworkerKindZbutController , rbFinworkerKindZbutInspektor ]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENBonusListObj.code);
    edtNumberGen.Text := ENBonusListObj.numberGen; 
    if ( ENBonusListObj.monthGen <> Low(Integer) ) then
       //edtMonthGen.Text := IntToStr(ENBonusListObj.monthGen)
       edtMonthGen.ItemIndex := ENBonusListObj.monthGen - 1
    else
       edtMonthGen.Text := '';
    if ( ENBonusListObj.yearGen <> Low(Integer) ) then
       //edtYearGen.Text := IntToStr(ENBonusListObj.yearGen)
       edtYearGen.ItemIndex := ENBonusListObj.yearGen - 2009
    else
       edtYearGen.Text := '';

     if ENBonusListObj.kindRef.code <> Low(Integer) then
       if ENBonusListObj.kindRef.code = ENConsts.FINWORKER_KIND_PROM then
          rbFinworkerKindTech.Checked := true
       else if ENBonusListObj.kindRef.code = ENConsts.FINWORKER_KIND_ESBYT then
          rbFinworkerKindZbut.Checked := true;

    if ENBonusListObj.department <> nil then
      if ENBonusListObj.department.code <> low(Integer) then
      begin
        TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

        edtDepartment.Text := TempENDepartment.getObject(ENBonusListObj.department.code).shortName;
      end;



  end;

  if (DialogState = dsInsert) then
  begin
    edtNumberGen.Text := 'Auto';
    SetComboBoxCurrentMonth(edtMonthGen);
    SetComboBoxCurrentYearWithStart(edtYearGen,2009,2);
    tsBonusItem.TabVisible:=false;


  end;
  if (DialogState <> dsInsert) then
    if ((ENBonusListObj.status.code = ENConsts.ENBONUSLIST_STATUS_APPROVED)
       or (DialogState = dsView) ) then
      DisableActions([actItemsInsert , actItemsDelete , actItemsEdit , actSetInvalidItem , actUnSetInvalidItem ]);

end;

procedure TfrmENBonusListEdit.PageControl1Change(Sender: TObject);
 var
  TempENBonusListItem: ENBonusListItemControllerSoapPort;
  i,a,b: Integer;
  ENBonusListItemList: ENBonusListItemShortList;
  bonusListItemFilter : ENBonusListItemFilter;
begin
  inherited;
    if PageControl1.ActivePageIndex = 1 then
    begin
      ClearGrid(sgENBonusListItem);
       for a:=1 to sgENBonusListItem.RowCount-1 do
        for b:=0 to sgENBonusListItem.ColCount-1 do
          sgENBonusListItem.Cells[b,a]:='';
          sgENBonusListItem.RowCount := 2;

           if ENBonusListObj.kindRef.code = ENConsts.FINWORKER_KIND_PROM then
            SetGridHeaders(ENBonusListItemHeadersNew, sgENBonusListItem.ColumnHeaders)
           else
           if (    (ENBonusListObj.kindRef.code = ENConsts.FINWORKER_KIND_ESBYT)
                or (ENBonusListObj.kindRef.code = ENConsts.FINWORKER_KIND_ESBYT_CONTROLLER)
                or (ENBonusListObj.kindRef.code = ENConsts.FINWORKER_KIND_ESBYT_INSPEKTOR)
            )
           then
            SetGridHeaders(ENBonusListItemHeadersZbytNew, sgENBonusListItem.ColumnHeaders);

            TempENBonusListItem :=  HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;

            bonusListItemFilter := ENBonusListItemFilter.Create;
            SetNullIntProps(bonusListItemFilter);
            SetNullXSProps(bonusListItemFilter);


            bonusListItemFilter.bonusList := ENBonusListRef.Create;
            bonusListItemFilter.bonusList.code := ENBonusListObj.code;

            bonusListItemFilter.orderBySQL := 'podrid , tabnumber';

                  ENBonusListItemList := TempENBonusListItem.getScrollableFilteredList(bonusListItemFilter,0,-1);

                  LastCount:=High(ENBonusListItemList.list);

                  if LastCount > -1 then
                     sgENBonusListItem.RowCount:=LastCount+2
                  else
                     sgENBonusListItem.RowCount:=2;

                   with sgENBonusListItem do
                    for i:=0 to LastCount do
                      begin
                        Application.ProcessMessages;
                        if ENBonusListItemList.list[i].statusCode = ENBONUSLISTITEM_STATUS_INVALID then
                           RowColor[i + 1] := clRed
                         else
                           RowColor[i + 1] := clNone;

                        if ENBonusListItemList.list[i].code <> Low(Integer) then
                        Cells[0,i+1] := IntToStr(ENBonusListItemList.list[i].code)
                        else
                        Cells[0,i+1] := '';
                        Cells[1,i+1] := ENBonusListItemList.list[i].podrId;
                        Cells[2,i+1] := ENBonusListItemList.list[i].podrName;
                        Cells[3,i+1] := ENBonusListItemList.list[i].fio;
                        Cells[4,i+1] := ENBonusListItemList.list[i].tabNumber;
                        Cells[5,i+1] := ENBonusListItemList.list[i].positionName;
                        if ENBonusListItemList.list[i].fundWorkTime = nil then
                          Cells[6,i+1] := ''
                        else
                          Cells[6,i+1] := ENBonusListItemList.list[i].fundWorkTime.DecimalString;
                        if ENBonusListItemList.list[i].workTimeFact = nil then
                          Cells[7,i+1] := ''
                        else
                          Cells[7,i+1] := ENBonusListItemList.list[i].workTimeFact.DecimalString;
                        if ENBonusListItemList.list[i].hoursWorkedWithStaff = nil then
                          Cells[8,i+1] := ''
                        else
                          Cells[8,i+1] := ENBonusListItemList.list[i].hoursWorkedWithStaff.DecimalString;
                        if ENBonusListItemList.list[i].timeDelivery = nil then
                          Cells[9,i+1] := ''
                        else
                          Cells[9,i+1] := ENBonusListItemList.list[i].timeDelivery.DecimalString;
                        if ENBonusListItemList.list[i].hoursWorkedPlan = nil then
                          Cells[10,i+1] := ''
                        else
                          Cells[10,i+1] := ENBonusListItemList.list[i].hoursWorkedPlan.DecimalString;
                        if ENBonusListItemList.list[i].hoursWorkedNotPlan = nil then
                          Cells[11,i+1] := ''
                        else
                          Cells[11,i+1] := ENBonusListItemList.list[i].hoursWorkedNotPlan.DecimalString;
                        if ENBonusListItemList.list[i].hoursWorkedSum = nil then
                          Cells[12,i+1] := ''
                        else
                          Cells[12,i+1] := ENBonusListItemList.list[i].hoursWorkedSum.DecimalString;
                        if ENBonusListItemList.list[i].percentLoadWork = nil then
                          Cells[13,i+1] := ''
                        else
                          Cells[13,i+1] := ENBonusListItemList.list[i].percentLoadWork.DecimalString;
                        if ENBonusListItemList.list[i].percentLoadByPlanWork = nil then
                          Cells[14,i+1] := ''
                        else
                          Cells[14,i+1] := ENBonusListItemList.list[i].percentLoadByPlanWork.DecimalString;
                        if ENBonusListItemList.list[i].percentLoadByNotPlanWork = nil then
                          Cells[15,i+1] := ''
                        else
                          Cells[15,i+1] := ENBonusListItemList.list[i].percentLoadByNotPlanWork.DecimalString;
                        if ENBonusListItemList.list[i].percentBonus = nil then
                          Cells[16,i+1] := ''
                        else
                          Cells[16,i+1] := ENBonusListItemList.list[i].percentBonus.DecimalString;
                        if ENBonusListItemList.list[i].coefficient = nil then
                          Cells[17,i+1] := ''
                        else
                          Cells[17,i+1] := ENBonusListItemList.list[i].coefficient.DecimalString;

                        if ENBonusListItemList.list[i].summaCompensation = nil then
                          Cells[18,i+1] := ''
                        else
                          Cells[18,i+1] := ENBonusListItemList.list[i].summaCompensation.DecimalString;

                        if ENBonusListItemList.list[i].coefficientQuality = nil then
                          Cells[19,i+1] := ''
                        else
                          Cells[19,i+1] := ENBonusListItemList.list[i].coefficientQuality.DecimalString;

                        if ENBonusListItemList.list[i].percentBonusForCharging = nil then
                          Cells[20,i+1] := ''
                        else
                          Cells[20,i+1] := ENBonusListItemList.list[i].percentBonusForCharging.DecimalString;

                        if ENBonusListItemList.list[i].countFactWorkedDays = nil then
                          Cells[21,i+1] := ''
                        else
                          Cells[21,i+1] := ENBonusListItemList.list[i].countFactWorkedDays.DecimalString;

                          Cells[22,i+1] := ENBonusListItemList.list[i].reasonInvalid;
                        LastRow:=i+1;
                        sgENBonusListItem.RowCount:=LastRow+1;
                      end;
                   sgENBonusListItem.Row:=1;
    end;
end;

procedure TfrmENBonusListEdit.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
    actPrintBonusListTechPersonalOnly.Visible:=
    ENBonusListObj.kindRef.code = ENConsts.FINWORKER_KIND_PROM;
end;

procedure TfrmENBonusListEdit.sgENBonusListItemDblClick(Sender: TObject);
//Var temp : Integer;
begin
    actItemsViewExecute(Sender);
end;

procedure TfrmENBonusListEdit.spbEPRenClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               if  ENBonusListObj.department = nil then ENBonusListObj.department := ENDepartmentRef.Create();
               ENBonusListObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENBonusListEdit.actItemsDeleteExecute(Sender: TObject);
Var TempENBonusListItem: ENBonusListItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBonusListItem.Cells[0,sgENBonusListItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки відомості нарахування премії для співробітників) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBonusListItem.remove(ObjCode);
      PageControl1.OnChange(Sender);
  end;
end;

procedure TfrmENBonusListEdit.actItemsEditExecute(Sender: TObject);
Var TempENBonusListItem: ENBonusListItemControllerSoapPort;
begin
 TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;
   try
     ENBonusListItemObj := TempENBonusListItem.getObject(StrToInt(sgENBonusListItem.Cells[0,sgENBonusListItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBonusListItemEdit:=TfrmENBonusListItemEdit.Create(Application, dsEdit);
  try
    if frmENBonusListItemEdit.ShowModal= mrOk then
      begin
        //TempENBonusListItem.save(ENBonusListItemObj);
        PageControl1.OnChange(Sender);
      end;
  finally
    frmENBonusListItemEdit.Free;
    frmENBonusListItemEdit:=nil;
  end;
end;

procedure TfrmENBonusListEdit.actItemsInsertExecute(Sender: TObject);
// Var TempENBonusListItem: ENBonusListItemControllerSoapPort;
begin
  // TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBonusListItemObj:=ENBonusListItem.Create;

   ENBonusListItemObj.fundWorkTime:= TXSDecimal.Create;
   ENBonusListItemObj.workTimeFact:= TXSDecimal.Create;
   ENBonusListItemObj.hoursWorkedWithStaff:= TXSDecimal.Create;
   ENBonusListItemObj.timeDelivery:= TXSDecimal.Create;
   ENBonusListItemObj.hoursWorkedPlan:= TXSDecimal.Create;
   ENBonusListItemObj.hoursWorkedNotPlan:= TXSDecimal.Create;
   ENBonusListItemObj.hoursWorkedSum:= TXSDecimal.Create;
   ENBonusListItemObj.percentLoadWork:= TXSDecimal.Create;
   ENBonusListItemObj.percentLoadByPlanWork:= TXSDecimal.Create;
   ENBonusListItemObj.percentLoadByNotPlanWork:= TXSDecimal.Create;
   ENBonusListItemObj.percentBonus:= TXSDecimal.Create;
   ENBonusListItemObj.coefficient:= TXSDecimal.Create;
   ENBonusListItemObj.percentBonusForCharging:= TXSDecimal.Create;
   ENBonusListItemObj.countFactWorkedDays:= TXSDecimal.Create;

   ENBonusListItemObj.bonusList := ENBonusListRef.Create;
   ENBonusListItemObj.bonusList.code := ENBonusListObj.code;


  try
    frmENBonusListItemEdit:=TfrmENBonusListItemEdit.Create(Application, dsInsert);
    try
      if frmENBonusListItemEdit.ShowModal = mrOk then
      begin
        if ENBonusListItemObj<>nil then
            //TempENBonusListItem.add(ENBonusListItemObj);
            PageControl1.OnChange(Sender);
      end;
    finally
      frmENBonusListItemEdit.Free;
      frmENBonusListItemEdit:=nil;
    end;
  finally
    ENBonusListItemObj.Free;
  end;
end;

procedure TfrmENBonusListEdit.actItemsUpdateExecute(Sender: TObject);
begin
  inherited;
  PageControl1.OnChange(Sender);
end;

procedure TfrmENBonusListEdit.actItemsViewExecute(Sender: TObject);
Var TempENBonusListItem: ENBonusListItemControllerSoapPort;
begin
 TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;
   try
     ENBonusListItemObj := TempENBonusListItem.getObject(StrToInt(sgENBonusListItem.Cells[0,sgENBonusListItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBonusListItemEdit:=TfrmENBonusListItemEdit.Create(Application, dsView);
  try
    frmENBonusListItemEdit.ShowModal;
  finally
    frmENBonusListItemEdit.Free;
    frmENBonusListItemEdit:=nil;
  end;
end;


procedure TfrmENBonusListEdit.actPrintBonusListTechPersonalOnlyExecute(
  Sender: TObject);
var
 argNames, args: ArrayOfString;
 reportName: String; //strTabNumbers: String;
begin

       SetLength(argNames, 5);
       SetLength(args, 5);

       argNames[0] := 'year';
       args[0]:= intToStr(ENBonusListObj.yearGen);

       argNames[1] := 'month';
       args[1]:= intToStr(ENBonusListObj.monthGen);

       argNames[2] := 'department';
       args[2]:= intToStr(ENBonusListObj.department.code);

       reportName := 'PercentPremiums/Tech/SavedPremiumsMain';
       makeReport(reportName, argNames, args, 'pdf');

end;

procedure TfrmENBonusListEdit.actSetInvalidItemExecute(Sender: TObject);
var
 strEnteredValue : String;
 TempENBonusListItem: ENBonusListItemControllerSoapPort;
  liObj : ENBonusListItem;
begin
  strEnteredValue:= '';
  TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;
   try
     liObj := TempENBonusListItem.getObject(StrToInt(sgENBonusListItem.Cells[0,sgENBonusListItem.Row]));
   except
   on EConvertError do Exit;
  end;

//  try
//    if frmENBonusListItemEdit.ShowModal= mrOk then
//      begin
//        PageControl1.OnChange(Sender);
//      end;
//  finally
//  end;
  if not InputQuery('EnergyNet', 'Введіть причину позначення рядка недісним', strEnteredValue) then
    Exit
  else
  begin
     // ShowMessage('inputText= ' +  strEnteredValue);
     if trim(strEnteredValue) = '' then
     begin
      Application.MessageBox(PChar('Вкажіть причину  !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
     end;

     liObj.reasonInvalid := strEnteredValue;
     TempENBonusListItem.SetBonusItemInvalid(liObj);
     PageControl1.OnChange(Sender);

  end;

end;

procedure TfrmENBonusListEdit.actUnSetInvalidItemExecute(Sender: TObject);
var
 strEnteredValue : String;
 TempENBonusListItem: ENBonusListItemControllerSoapPort;
 liObj : ENBonusListItem;
begin
  strEnteredValue:= '';
  TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;
   try
     liObj := TempENBonusListItem.getObject(StrToInt(sgENBonusListItem.Cells[0,sgENBonusListItem.Row]));
   except
   on EConvertError do Exit;
  end;
//  try
//    if frmENBonusListItemEdit.ShowModal= mrOk then
//      begin
//        PageControl1.OnChange(Sender);
//      end;
//  finally
//  end;
     TempENBonusListItem.UnSetBonusItemInvalid(liObj);
     PageControl1.OnChange(Sender);

end;

procedure TfrmENBonusListEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBonusList: ENBonusListControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtMonthGen
      ,edtYearGen
     ])  then
  begin
      Application.MessageBox(PChar('Пусті поля неприпустимі !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else if ( (rbFinworkerKindTech.Checked = false )
            and
            (rbFinworkerKindZbut.Checked = false )
            and
            (rbFinworkerKindZbutController.Checked = false )
            and
            (rbFinworkerKindZbutInspektor.Checked = false )
           )  then
  begin
      Application.MessageBox(PChar('Не обрано тип персонала  !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else if ( edtDepartment.Text = ''  )  then
  begin
      Application.MessageBox(PChar('Не обрано підрозділ  !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBonusList := HTTPRIOENBonusList as ENBonusListControllerSoapPort;


     ENBonusListObj.numberGen := edtNumberGen.Text; 

     if ( edtMonthGen.Text <> '' ) then
       ENBonusListObj.monthGen := edtMonthGen.ItemIndex+1
     else
       ENBonusListObj.monthGen := Low(Integer) ;



     if ( edtYearGen.Text <> '' ) then
       ENBonusListObj.yearGen := StrToInt(edtYearGen.Text)
     else
       ENBonusListObj.yearGen := Low(Integer) ;

       ENBonusListObj.kindRef := FINWorkerKindRef.Create;
       if (rbFinworkerKindTech.Checked = true) then
         ENBonusListObj.kindRef.code := ENConsts.FINWORKER_KIND_PROM
       else if (rbFinworkerKindZbut.Checked = true) then
         ENBonusListObj.kindRef.code := ENConsts.FINWORKER_KIND_ESBYT
       else if (rbFinworkerKindZbutController.Checked = true) then
         ENBonusListObj.kindRef.code := ENConsts.FINWORKER_KIND_ESBYT_CONTROLLER
       else if (rbFinworkerKindZbutInspektor.Checked = true) then
         ENBonusListObj.kindRef.code := ENConsts.FINWORKER_KIND_ESBYT_INSPEKTOR;

    if DialogState = dsInsert then
    begin
      ENBonusListObj.code:=low(Integer);
      TempENBonusList.add(ENBonusListObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBonusList.save(ENBonusListObj);
    end;
  end;
end;


procedure TfrmENBonusListEdit.FormCreate(Sender: TObject);
begin
  //inherited;
  BorderStyle:= bsSizeable;
end;

end.