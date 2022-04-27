
unit EditENTrptGPS2TrptReal;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTrptGPS2TrptRealController ;

type
  TfrmENTrptGPS2TrptRealEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCodeTranpostGps : TLabel;
    edtCodeTranpostGps: TEdit;

  lblTKTransportRealRealTransportName : TLabel;
  edtTKTransportRealRealTransportName : TEdit;
  spbTKTransportRealRealTransport : TSpeedButton;
  

  HTTPRIOENTrptGPS2TrptReal: THTTPRIO;

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
  frmENTrptGPS2TrptRealEdit: TfrmENTrptGPS2TrptRealEdit;
  ENTrptGPS2TrptRealObj: ENTrptGPS2TrptReal;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTrptGPS2TrptRealController  ;
}
{$R *.dfm}



procedure TfrmENTrptGPS2TrptRealEdit.FormShow(Sender: TObject);

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
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTrptGPS2TrptRealObj.code);
    edtCodeTranpostGps.Text := ENTrptGPS2TrptRealObj.codeTranpostGps; 

    edtTKTransportRealRealTransportName.Text := ENTrptGPS2TrptRealObj.realTransport.name;

  end;
end;



procedure TfrmENTrptGPS2TrptRealEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTrptGPS2TrptReal: ENTrptGPS2TrptRealControllerSoapPort;
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
    TempENTrptGPS2TrptReal := HTTPRIOENTrptGPS2TrptReal as ENTrptGPS2TrptRealControllerSoapPort;


     ENTrptGPS2TrptRealObj.codeTranpostGps := edtCodeTranpostGps.Text; 

    if DialogState = dsInsert then
    begin
      ENTrptGPS2TrptRealObj.code:=low(Integer);
      TempENTrptGPS2TrptReal.add(ENTrptGPS2TrptRealObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTrptGPS2TrptReal.save(ENTrptGPS2TrptRealObj);
    end;
  end;
end;


procedure TfrmENTrptGPS2TrptRealEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTrptGPS2TrptRealObj.realTransport = nil then ENTrptGPS2TrptRealObj.realTransport := TKTransportReal.Create();
               ENTrptGPS2TrptRealObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
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