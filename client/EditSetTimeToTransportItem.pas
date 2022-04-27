unit EditSetTimeToTransportItem;

interface

uses
   Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ExtCtrls, ENConsts, ENTransportOrderController, ShowENTransportDepartment,
    ENTransportDepartmentController, ShowENTransportOrder;

type
  TfrmSetTimeToTransportItem = class(TDialogForm)
    HTTPRIOENTransportOrder: THTTPRIO;
    HTTPRIOENTransportDepartment: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    pcTransportOrder: TPageControl;
    tbTime: TTabSheet;
    lblDateFinal: TLabel;
    lblTimeFinal: TLabel;
    lblDateStart: TLabel;
    lblTimeStart: TLabel;
    edtTimeFinal: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    edtTimeStart: TDateTimePicker;
    edtDateStart: TDateTimePicker;
    tbTransportOrderDepartment: TTabSheet;
    lblParentOrder: TLabel;
    edtParentOrder: TEdit;
    spbParentOrder: TSpeedButton;
    spbParentOrderClear: TSpeedButton;
    HTTPRIOENPlanWork: THTTPRIO;
    Label1: TLabel;
    chbIsAssignment: TCheckBox;
    spbDepartment: TSpeedButton;
    edtDepartment: TEdit;
    lblDepartment: TLabel;
    procedure FormShow(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbParentOrderClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbParentOrderClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ENTransportOrderObj : ENTransportOrder;
    transportDepartmentCode : integer;
  end;

var
  frmSetTimeToTransportItem : TfrmSetTimeToTransportItem;

implementation

uses
ENPlanWorkController;

{$R *.dfm}

procedure TfrmSetTimeToTransportItem.FormShow(Sender: TObject);
var
 TempENTransportOrder: ENTransportOrderControllerSoapPort;
 TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
 ENTransportDepObj: ENTransportDepartment;
 parentOrderObj : ENTransportOrder;

begin
  inherited;

  parentOrderObj := nil;
  DenyBlankValues([edtDepartment]);
  DisableControls([edtDepartment, edtParentOrder]);


 TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
 TempENTransportDepartment := HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;


 HideControls([lblParentOrder, edtParentOrder, spbParentOrder, spbParentOrderClear], DialogState<> dsEdit);

  if (DialogState = dsEdit) then
  begin
      if (ENTransportOrderObj <> nil) or (ENTransportOrderObj.code <> Low(Integer)) then
      begin

             if (ENTransportOrderObj.transportDepartment <> nil) and (ENTransportOrderObj.transportDepartment.code <> Low(Integer))  then
                ENTransportDepObj :=  TempENTransportDepartment.getObject(ENTransportOrderObj.transportDepartment.code);

             if (ENTransportOrderObj.parentRef.code <> Low(Integer)) and (ENTransportOrderObj.parentRef <> nil) then
              begin
                parentOrderObj := TempENTransportOrder.getObject(ENTransportOrderObj.parentRef.code);
              end;
              
            edtDateStart.Date := ENTransportOrderObj.dateStart.AsDateTime;
            edtDateFinal.Date := ENTransportOrderObj.dateFinal.AsDateTime;

            edtTimeFinal.Time :=  EncodeTime(ENTransportOrderObj.timeFinal.Hour,ENTransportOrderObj.timeFinal.Minute, 0, 0);
            edtTimeStart.Time :=  EncodeTime(ENTransportOrderObj.timeStart.Hour,ENTransportOrderObj.timeStart.Minute, 0, 0);

            if ((ENTransportDepObj.code <> Low(Integer)) and (ENTransportDepObj <> nil)) then
            begin
                edtDepartment.Text := ENTransportDepObj.name;
                transportDepartmentCode := ENTransportDepObj.code;
            end;

            if (parentOrderObj <> nil) then
            begin
                edtParentOrder.Text := parentOrderObj.numbergen;
            end;

            if(ENTransportOrderObj.isAssignment = ENConsts.ENTRANSPORTORDER_ISASSIGNMENT_TRUE) then
              chbIsAssignment.Checked := true;

      end;

  end;


end;

procedure TfrmSetTimeToTransportItem.spbDepartmentClick(Sender: TObject);
var
   frmENTransportDepartmentShow : TfrmENTransportDepartmentShow;

begin



   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin

        if ShowModal = mrOk then
        begin
            try
               edtDepartment.Text := GetReturnValue(sgENTransportDepartment,1);
               transportDepartmentCode := StrToInt(GetReturnValue(sgENTransportDepartment,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
end;
end;

procedure TfrmSetTimeToTransportItem.spbParentOrderClick(Sender: TObject);
var
   frmENTransportOrderShow : TfrmENTransportOrderShow;
   filterObj : ENTransportOrderFilter;
   TempENPlanWork : ENPlanWorkControllerSoapPort;
   ENPlanWorkObj : ENPlanWork;


begin

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    ENPlanWorkObj := TempENPlanWork.getObject(ENTransportOrderObj.planRef.code);

    if(ENPlanWorkObj.kind.code <> ENPLANWORKKIND_NPZ) then
    begin
      Application.MessageBox(PChar('Створювати сумісні заяви можливо тільки для заявок для планів виду ''Завдання-план'' !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
    end;

    filterObj := ENTransportOrderFilter.Create;
    SetNullIntProps(filterObj);
    SetNullXSProps(filterObj);

      filterObj.transportDepartment := ENTransportDepartmentRef.Create;
      filterObj.transportDepartment.code :=  ENTransportOrderObj.transportDepartment.code;
      filterObj.conditionSQL := 'ENTRANSPORTORDER.CODE IN (select distinct entransportorder.code from ' +
                                ' entransportorder, ' +
                                ' entrnsprtrdr2trnsprttm, ' +
                                ' entransportitem, ' +
                                ' enplanwork ' +
                                ' where ' +
                                ' entransportorder.code = entrnsprtrdr2trnsprttm.transportordercode ' +
                                ' and entrnsprtrdr2trnsprttm.transportitemcode = entransportitem.code ' +
                                ' and entransportorder.code <> ' + IntToStr(ENTransportOrderObj.code) +
                                ' and entransportorder.planrefcode <> ' + IntToStr(ENTransportOrderObj.planRef.code) +
                                ' and entransportitem.tktransporttypecode = ' + IntToStr(TKTRANSPORT_TYPE_BRIGADE)+
                                ' and entransportorder.planrefcode = enplanwork.code ' +
                                ' and entransportorder.transportorderstatuscd = ' + IntToStr(ENTRANSPORTORDERSTATUS_GOOD) +
                                ' and enplanwork.kindcode = ' + IntToStr(ENPLANWORKKIND_NPZ) +
                                ' and to_date(to_char(entransportorder.datestart,''dd.MM.yyyy''),''dd.MM.yyyy'') >=''' + DateToStr(ENTransportOrderObj.dateStart.AsDateTime) + '''' +
                                ' and to_date(to_char(entransportorder.datefinal,''dd.MM.yyyy''),''dd.MM.yyyy'') <=''' + DateToStr(ENTransportOrderObj.dateFinal.AsDateTime) + ''')';

   frmENTransportOrderShow:=TfrmENTransportOrderShow.Create(Application,fmNormal, filterObj);
   try
      with frmENTransportOrderShow do begin

      strFilter := filterObj.conditionSQL;

        if ShowModal = mrOk then
        begin
            try
               edtParentOrder.Text := GetReturnValue(sgENTransportOrder,1);
               ENTransportOrderObj.parentRef.code := StrToInt(GetReturnValue(sgENTransportOrder,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENTransportOrderShow.Free;
end;
end;

procedure TfrmSetTimeToTransportItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDepartment
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end;
end;

procedure TfrmSetTimeToTransportItem.FormCreate(Sender: TObject);
begin
  inherited;
  transportDepartmentCode := Low(Integer);
end;

procedure TfrmSetTimeToTransportItem.spbParentOrderClearClick(
  Sender: TObject);
begin
  inherited;
  if(ENTransportOrderObj.parentRef <> nil) and (ENTransportOrderObj.parentRef.code <> Low(Integer)) then
  begin
      ENTransportOrderObj.parentRef.code := Low(Integer);
      edtParentOrder.Text := '';
  end;
end;

end.
