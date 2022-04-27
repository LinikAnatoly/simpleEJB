
unit EditENTransportTemperature;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportTemperatureController,
  ENTransportDepartmentController, ShowENTransportDepartment ;

type
  TfrmENTransportTemperatureEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;


  HTTPRIOENTransportTemperature: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENTransportDepartmentName: TLabel;
    edtENTransportDepartmentName: TEdit;
    spbENTransportDepartment: TSpeedButton;
    HTTPRIOENTransportDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure setENTransportDepartmentName;
    procedure spbENTransportDepartmentClick(Sender: TObject);

  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportTemperatureEdit: TfrmENTransportTemperatureEdit;
  ENTransportTemperatureObj: ENTransportTemperature;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportTemperatureController  ;
}
{$R *.dfm}



procedure TfrmENTransportTemperatureEdit.FormShow(Sender: TObject);
begin

  DisableControls([edtCode, edtENTransportDepartmentName]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTransportTemperatureObj.code);
    if ( ENTransportTemperatureObj.countGen <> nil ) then
       edtCountGen.Text := ENTransportTemperatureObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 
      if ENTransportTemperatureObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTransportTemperatureObj.dateGen.Year,ENTransportTemperatureObj.dateGen.Month,ENTransportTemperatureObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := true;
      end;
      Self.setENTransportDepartmentName;
  end;
end;



procedure TfrmENTransportTemperatureEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportTemperature: ENTransportTemperatureControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen,
      edtDateGen,
      edtENTransportDepartmentName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransportTemperature := HTTPRIOENTransportTemperature as ENTransportTemperatureControllerSoapPort;


     if (ENTransportTemperatureObj.countGen = nil ) then
       ENTransportTemperatureObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENTransportTemperatureObj.countGen.decimalString := edtCountGen.Text 
     else
       ENTransportTemperatureObj.countGen := nil;

     if edtdateGen.checked then
     begin
       if ENTransportTemperatureObj.dateGen = nil then
          ENTransportTemperatureObj.dateGen := TXSDate.Create;
       ENTransportTemperatureObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTransportTemperatureObj.dateGen := nil;

    if DialogState = dsInsert then
    begin
      ENTransportTemperatureObj.code:=low(Integer);
      TempENTransportTemperature.add(ENTransportTemperatureObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportTemperature.save(ENTransportTemperatureObj);
    end;
  end;
end;

procedure TfrmENTransportTemperatureEdit.setENTransportDepartmentName;
var
  ENTransportDepartmentObj : ENTransportDepartment;
  TempENTransportDepartment : ENTransportDepartmentControllerSoapPort;
begin
      TempENTransportDepartment := HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;
      ENTransportDepartmentObj := TempENTransportDepartment.getObject(ENTransportTemperatureObj.transportDepartmentRef.code);
      edtENTransportDepartmentName.Text := ENTransportDepartmentObj.name;
end;

procedure TfrmENTransportTemperatureEdit.spbENTransportDepartmentClick(
  Sender: TObject);
 var
   frmENTransportDepartmentShow: TfrmENTransportDepartmentShow;
   f : ENTransportDepartmentFilter;
begin
   f := ENTransportDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENTransportTemperatureObj.transportDepartmentRef = nil then ENTransportTemperatureObj.transportDepartmentRef := ENTransportDepartmentRef.Create();
               ENTransportTemperatureObj.transportDepartmentRef.code := StrToInt(GetReturnValue(sgENTransportDepartment,0));
               edtENTransportDepartmentName.Text:= GetReturnValue(sgENTransportDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;

end;


end.