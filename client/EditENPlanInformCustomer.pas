
unit EditENPlanInformCustomer;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanInformCustomerController ;

type
  TfrmENPlanInformCustomerEdit = class(TDialogForm)
  
    lblCode : TLabel;
	  edtCode : TEdit;
    lblTimeStart : TLabel;
    edtDate: TDateTimePicker;


  HTTPRIOENPlanInformCustomer: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtTimeStart: TDateTimePicker;
    edtTimeFinal: TDateTimePicker;
    chbFirstHalf: TCheckBox;
    chbSecondHalf: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chbFirstHalfClick(Sender: TObject);
    procedure chbSecondHalfClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    planCode : Integer;
    isForWorkOrderBytMassSMSInfoSet : Boolean;

end;

var
  frmENPlanInformCustomerEdit: TfrmENPlanInformCustomerEdit;
  ENPlanInformCustomerObj: ENPlanInformCustomer;

implementation

uses ENPlanWorkController;


{uses  
    EnergyproController, EnergyproController2, ENPlanInformCustomerController  ;
}
{$R *.dfm}



procedure TfrmENPlanInformCustomerEdit.FormCreate(Sender: TObject);
begin
  inherited;
  isForWorkOrderBytMassSMSInfoSet := False;
end;

procedure TfrmENPlanInformCustomerEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtTimeStart
      ,edtDate
      ,edtTimeFinal

     ]);
     chbFirstHalf.Visible := True;
     chbSecondHalf.Visible := True;
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENPlanInformCustomerObj.code);
      SetDateFieldForDateTimePicker(edtDate, ENPlanInformCustomerObj.timeStart);

      if ENPlanInformCustomerObj.timeStart <> nil then
      begin
        edtTimeStart.Time := EncodeTime(ENPlanInformCustomerObj.timeStart.Hour,ENPlanInformCustomerObj.timeStart.Minute, 0, 0);
        edtDate.Date :=  EncodeDate(ENPlanInformCustomerObj.timeStart.Year,ENPlanInformCustomerObj.timeStart.Month,ENPlanInformCustomerObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Time;
        edtTimeStart.checked := false;
      end;

      if ENPlanInformCustomerObj.timeFinal <> nil then
      begin
        edtTimeFinal.Time:= EncodeTime(ENPlanInformCustomerObj.timeFinal.Hour,ENPlanInformCustomerObj.timeFinal.Minute, 0, 0);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Time;
        edtTimeFinal.checked := false;
      end;



  end;
end;



procedure TfrmENPlanInformCustomerEdit.chbFirstHalfClick(Sender: TObject);
begin
     if edtTimeStart.Checked = False then
     edtTimeStart.Checked := True;
     edtTimeStart.DateTime := StrToTime('08:30');
     if edtTimeFinal.Checked = False then
     edtTimeStart.Checked := True;
     edtTimeFinal.DateTime := StrToTime('12:30');
     chbSecondHalf.Checked := False;
end;

procedure TfrmENPlanInformCustomerEdit.chbSecondHalfClick(Sender: TObject);
begin
     if edtTimeStart.Checked = False then
     edtTimeStart.Checked := True;
     edtTimeStart.DateTime := StrToTime('13:30');
     if edtTimeFinal.Checked = False then
     edtTimeStart.Checked := True;
     edtTimeFinal.DateTime := StrToTime('16:30');
     chbFirstHalf.Checked := False;
end;

procedure TfrmENPlanInformCustomerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanInformCustomer: ENPlanInformCustomerControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDate
      ,edtTimeStart
      ,edtTimeFinal
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  if (edtTimeFinal.DateTime < edtTimeStart.DateTime)  then
  begin
     Application.MessageBox(PChar('Час закінчення менше часу початку!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
     Action:=caNone;
  end
  else
  begin
    TempENPlanInformCustomer := HTTPRIOENPlanInformCustomer as ENPlanInformCustomerControllerSoapPort;

    if  (isForWorkOrderBytMassSMSInfoSet=false) then
    begin
        if (DialogState = dsInsert) then
        begin
          ENPlanInformCustomerObj.planRef := ENPlanWorkRef.Create;
          ENPlanInformCustomerObj.planRef.code := planCode;
        end;

        if ENPlanInformCustomerObj.timeStart = nil then
        ENPlanInformCustomerObj.timeStart := TXSDateTime.Create;
        ENPlanInformCustomerObj.timeStart.XSToNative(GetXSDate(edtdate.Date));
        ENPlanInformCustomerObj.timeStart.XSToNative(GetXSDateTime(edtTimeStart.Time));

        if ENPlanInformCustomerObj.timeFinal = nil then
        ENPlanInformCustomerObj.timeFinal := TXSDateTime.Create;
        ENPlanInformCustomerObj.timeFinal.XSToNative(GetXSDate(edtdate.Date));
        ENPlanInformCustomerObj.timeFinal.XSToNative(GetXSDateTime(edtTimeFinal.Time));

        if DialogState = dsInsert then
        begin
          ENPlanInformCustomerObj.code:=low(Integer);
          TempENPlanInformCustomer.add(ENPlanInformCustomerObj);
        end
        else
        if DialogState = dsEdit then
        begin
          TempENPlanInformCustomer.save(ENPlanInformCustomerObj);
        end;
    end;
  end;
end;


end.