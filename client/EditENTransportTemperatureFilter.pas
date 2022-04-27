
unit EditENTransportTemperatureFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportTemperatureController,
  ENTransportDepartmentController, ShowENTransportDepartment ;

type
  TfrmENTransportTemperatureFilterEdit = class(TDialogForm)

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
    spbENTransportDepartmentClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENTransportDepartmentClick(Sender: TObject);
    procedure spbENTransportDepartmentClearClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportTemperatureFilterEdit: TfrmENTransportTemperatureFilterEdit;
  ENTransportTemperatureFilterObj: ENTransportTemperatureFilter;

implementation


{uses
    EnergyproController, EnergyproController2, ENTransportTemperatureController  ;
}
{$R *.dfm}



procedure TfrmENTransportTemperatureFilterEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtENTransportDepartmentName]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENTransportTemperatureFilterObj.countGen <> nil ) then
       edtCountGen.Text := ENTransportTemperatureFilterObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



      if ENTransportTemperatureFilterObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTransportTemperatureFilterObj.dateGen.Year,ENTransportTemperatureFilterObj.dateGen.Month,ENTransportTemperatureFilterObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

  end;

end;



procedure TfrmENTransportTemperatureFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportTemperature: ENTransportTemperatureControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENTransportTemperatureFilterObj.countGen = nil ) then
       ENTransportTemperatureFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENTransportTemperatureFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       ENTransportTemperatureFilterObj.countGen := nil;




     if edtdateGen.checked then
     begin 
       if ENTransportTemperatureFilterObj.dateGen = nil then
          ENTransportTemperatureFilterObj.dateGen := TXSDate.Create;
       ENTransportTemperatureFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTransportTemperatureFilterObj.dateGen := nil;

  end;
end;




procedure TfrmENTransportTemperatureFilterEdit.spbENTransportDepartmentClick(
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
               if ENTransportTemperatureFilterObj.transportDepartmentRef = nil then ENTransportTemperatureFilterObj.transportDepartmentRef := ENTransportDepartmentRef.Create();
               ENTransportTemperatureFilterObj.transportDepartmentRef.code := StrToInt(GetReturnValue(sgENTransportDepartment,0));
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

procedure TfrmENTransportTemperatureFilterEdit.spbENTransportDepartmentClearClick(
  Sender: TObject);
begin
  inherited;
  edtENTransportDepartmentName.Text:= '';
  if (ENTransportTemperatureFilterObj <> nil) and (ENTransportTemperatureFilterObj.transportDepartmentRef <> nil) then
      ENTransportTemperatureFilterObj.transportDepartmentRef := nil;
end;

end.