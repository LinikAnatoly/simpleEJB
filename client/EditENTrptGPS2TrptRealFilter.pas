
unit EditENTrptGPS2TrptRealFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTrptGPS2TrptRealController ;

type
  TfrmENTrptGPS2TrptRealFilterEdit = class(TDialogForm)

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
  frmENTrptGPS2TrptRealFilterEdit: TfrmENTrptGPS2TrptRealFilterEdit;
  ENTrptGPS2TrptRealFilterObj: ENTrptGPS2TrptRealFilter;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTrptGPS2TrptRealController  ;
}
{$R *.dfm}



procedure TfrmENTrptGPS2TrptRealFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtCodeTranpostGps.Text := ENTrptGPS2TrptRealObj.codeTranpostGps; 


  end;

}

end;



procedure TfrmENTrptGPS2TrptRealFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTrptGPS2TrptReal: ENTrptGPS2TrptRealControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTrptGPS2TrptRealFilterObj.codeTranpostGps := edtCodeTranpostGps.Text; 




  end;
end;

procedure TfrmENTrptGPS2TrptRealFilterEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTrptGPS2TrptRealFilterObj.realTransport = nil then ENTrptGPS2TrptRealFilterObj.realTransport := TKTransportReal.Create();
               ENTrptGPS2TrptRealFilterObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
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