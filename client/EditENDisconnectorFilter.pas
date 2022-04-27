
unit EditENDisconnectorFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDisconnectorController ;

type
  TfrmENDisconnectorFilterEdit = class(TDialogForm)

    lblRatedVoltage : TLabel;
    edtRatedVoltage: TEdit;

    lblRatedCurrent : TLabel;
    edtRatedCurrent: TEdit;


  lblENDisconnectorTypeDisconnectorTypeName : TLabel;
  edtENDisconnectorTypeDisconnectorTypeName : TEdit;
  spbENDisconnectorTypeDisconnectorType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENHighVoltageSellHighvoltageSellName : TLabel;
  edtENHighVoltageSellHighvoltageSellName : TEdit;
  spbENHighVoltageSellHighvoltageSell : TSpeedButton;
  

  HTTPRIOENDisconnector: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDisconnectorTypeDisconnectorTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDisconnectorFilterEdit: TfrmENDisconnectorFilterEdit;
  ENDisconnectorFilterObj: ENDisconnectorFilter;

implementation

uses
  ShowENDisconnectorType
  ,ENDisconnectorTypeController
  ,ShowENElement
  ,ENElementController
  ,ShowENHighVoltageSell
  ,ENHighVoltageSellController
;

{uses  
    EnergyproController, EnergyproController2, ENDisconnectorController  ;
}
{$R *.dfm}



procedure TfrmENDisconnectorFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtRatedVoltage
      ,edtRatedCurrent
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENDisconnectorObj.ratedVoltage <> nil ) then
       edtRatedVoltage.Text := ENDisconnectorObj.ratedVoltage.decimalString
    else
       edtRatedVoltage.Text := ''; 



    if ( ENDisconnectorObj.ratedCurrent <> nil ) then
       edtRatedCurrent.Text := ENDisconnectorObj.ratedCurrent.decimalString
    else
       edtRatedCurrent.Text := ''; 


  end;

}

end;



procedure TfrmENDisconnectorFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENDisconnector: ENDisconnectorControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENDisconnectorFilterObj.ratedVoltage = nil ) then
       ENDisconnectorFilterObj.ratedVoltage := TXSDecimal.Create;
     if edtRatedVoltage.Text <> '' then
       ENDisconnectorFilterObj.ratedVoltage.decimalString := edtRatedVoltage.Text 
     else
       ENDisconnectorFilterObj.ratedVoltage := nil;




     if (ENDisconnectorFilterObj.ratedCurrent = nil ) then
       ENDisconnectorFilterObj.ratedCurrent := TXSDecimal.Create;
     if edtRatedCurrent.Text <> '' then
       ENDisconnectorFilterObj.ratedCurrent.decimalString := edtRatedCurrent.Text 
     else
       ENDisconnectorFilterObj.ratedCurrent := nil;





  end;
end;

procedure TfrmENDisconnectorFilterEdit.spbENDisconnectorTypeDisconnectorTypeClick(Sender : TObject);
var 
   frmENDisconnectorTypeShow: TfrmENDisconnectorTypeShow;
begin
   frmENDisconnectorTypeShow:=TfrmENDisconnectorTypeShow.Create(Application,fmNormal);
   try
      with frmENDisconnectorTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDisconnectorFilterObj.disconnectorType = nil then ENDisconnectorFilterObj.disconnectorType := ENDisconnectorType.Create();
               ENDisconnectorFilterObj.disconnectorType.code := StrToInt(GetReturnValue(sgENDisconnectorType,0));
               edtENDisconnectorTypeDisconnectorTypeName.Text:=GetReturnValue(sgENDisconnectorType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDisconnectorTypeShow.Free;
   end;
end;


procedure TfrmENDisconnectorFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDisconnectorFilterObj.element = nil then ENDisconnectorFilterObj.element := ENElement.Create();
               ENDisconnectorFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENDisconnectorFilterEdit.spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);
var 
   frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
begin
   frmENHighVoltageSellShow:=TfrmENHighVoltageSellShow.Create(Application,fmNormal);
   try
      with frmENHighVoltageSellShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDisconnectorFilterObj.highvoltageSell = nil then ENDisconnectorFilterObj.highvoltageSell := ENHighVoltageSell.Create();
               ENDisconnectorFilterObj.highvoltageSell.code := StrToInt(GetReturnValue(sgENHighVoltageSell,0));
               edtENHighVoltageSellHighvoltageSellName.Text:=GetReturnValue(sgENHighVoltageSell,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENHighVoltageSellShow.Free;
   end;
end;





end.