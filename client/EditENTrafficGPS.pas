
unit EditENTrafficGPS;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTrafficGPSController ;

type
  TfrmENTrafficGPSEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblSumKm : TLabel;
    edtSumKm: TEdit;
    lblSumFuel : TLabel;
    edtSumFuel: TEdit;

  lblTKTransportRealRealTransportName : TLabel;
  edtTKTransportRealRealTransportName : TEdit;
  spbTKTransportRealRealTransport : TSpeedButton;
  

  HTTPRIOENTrafficGPS: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealRealTransportClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTrafficGPSEdit: TfrmENTrafficGPSEdit;
   ENTrafficGPSObj: ENTrafficGPS;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTrafficGPSController  ;
}
{$R *.dfm}



procedure TfrmENTrafficGPSEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtTKTransportRealRealTransportName
      ,spbTKTransportRealRealTransport
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTrafficGPSObj.code);
      if ENTrafficGPSObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTrafficGPSObj.dateGen.Year,ENTrafficGPSObj.dateGen.Month,ENTrafficGPSObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    if ( ENTrafficGPSObj.sumKm <> nil ) then
       edtSumKm.Text := ENTrafficGPSObj.sumKm.decimalString
    else
       edtSumKm.Text := ''; 
    if ( ENTrafficGPSObj.sumFuel <> nil ) then
       edtSumFuel.Text := ENTrafficGPSObj.sumFuel.decimalString
    else
       edtSumFuel.Text := ''; 

    edtTKTransportRealRealTransportName.Text := ENTrafficGPSObj.realTransport.name;

  end;
end;



procedure TfrmENTrafficGPSEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTrafficGPS: ENTrafficGPSControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTrafficGPS := HTTPRIOENTrafficGPS as ENTrafficGPSControllerSoapPort;


     if edtdateGen.checked then
     begin 
       if ENTrafficGPSObj.dateGen = nil then
          ENTrafficGPSObj.dateGen := TXSDate.Create;
       ENTrafficGPSObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTrafficGPSObj.dateGen := nil;

     if (ENTrafficGPSObj.sumKm = nil ) then
       ENTrafficGPSObj.sumKm := TXSDecimal.Create;
     if edtSumKm.Text <> '' then
       ENTrafficGPSObj.sumKm.decimalString := edtSumKm.Text 
     else
       ENTrafficGPSObj.sumKm := nil;

     if (ENTrafficGPSObj.sumFuel = nil ) then
       ENTrafficGPSObj.sumFuel := TXSDecimal.Create;
     if edtSumFuel.Text <> '' then
       ENTrafficGPSObj.sumFuel.decimalString := edtSumFuel.Text 
     else
       ENTrafficGPSObj.sumFuel := nil;

    if DialogState = dsInsert then
    begin
      ENTrafficGPSObj.code:=low(Integer);
      TempENTrafficGPS.add(ENTrafficGPSObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTrafficGPS.save(ENTrafficGPSObj);
    end;
  end;
end;


procedure TfrmENTrafficGPSEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTrafficGPSObj.realTransport = nil then ENTrafficGPSObj.realTransport := TKTransportReal.Create();
               ENTrafficGPSObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealRealTransportName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;



end.