
unit EditENInsulatorFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInsulatorController ;

type
  TfrmENInsulatorFilterEdit = class(TDialogForm)

    lblVoltage : TLabel;
    edtVoltage: TEdit;

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;


  lblENInsulatorTypeInsulatorTypeName : TLabel;
  edtENInsulatorTypeInsulatorTypeName : TEdit;
  spbENInsulatorTypeInsulatorType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENHighVoltageSellHighvoltageSellName : TLabel;
  edtENHighVoltageSellHighvoltageSellName : TEdit;
  spbENHighVoltageSellHighvoltageSell : TSpeedButton;
  

  HTTPRIOENInsulator: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENInsulatorTypeInsulatorTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENInsulatorFilterEdit: TfrmENInsulatorFilterEdit;
  ENInsulatorFilterObj: ENInsulatorFilter;

implementation

uses
  ShowENInsulatorType
  ,ENInsulatorTypeController
  ,ShowENElement
  ,ENElementController
  ,ShowENHighVoltageSell
  ,ENHighVoltageSellController
;

{uses  
    EnergyproController, EnergyproController2, ENInsulatorController  ;
}
{$R *.dfm}



procedure TfrmENInsulatorFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtVoltage
      ,edtNumberGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENInsulatorObj.voltage <> nil ) then
       edtVoltage.Text := ENInsulatorObj.voltage.decimalString
    else
       edtVoltage.Text := ''; 



    if ( ENInsulatorObj.numberGen <> nil ) then
       edtNumberGen.Text := ENInsulatorObj.numberGen.decimalString
    else
       edtNumberGen.Text := ''; 


  end;

}

end;



procedure TfrmENInsulatorFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENInsulator: ENInsulatorControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENInsulatorFilterObj.voltage = nil ) then
       ENInsulatorFilterObj.voltage := TXSDecimal.Create;
     if edtVoltage.Text <> '' then
       ENInsulatorFilterObj.voltage.decimalString := edtVoltage.Text 
     else
       ENInsulatorFilterObj.voltage := nil;




     if (ENInsulatorFilterObj.numberGen = nil ) then
       ENInsulatorFilterObj.numberGen := TXSDecimal.Create;
     if edtNumberGen.Text <> '' then
       ENInsulatorFilterObj.numberGen.decimalString := edtNumberGen.Text 
     else
       ENInsulatorFilterObj.numberGen := nil;





  end;
end;

procedure TfrmENInsulatorFilterEdit.spbENInsulatorTypeInsulatorTypeClick(Sender : TObject);
var 
   frmENInsulatorTypeShow: TfrmENInsulatorTypeShow;
begin
   frmENInsulatorTypeShow:=TfrmENInsulatorTypeShow.Create(Application,fmNormal);
   try
      with frmENInsulatorTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENInsulatorFilterObj.insulatorType = nil then ENInsulatorFilterObj.insulatorType := ENInsulatorType.Create();
               ENInsulatorFilterObj.insulatorType.code := StrToInt(GetReturnValue(sgENInsulatorType,0));
               edtENInsulatorTypeInsulatorTypeName.Text:=GetReturnValue(sgENInsulatorType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENInsulatorTypeShow.Free;
   end;
end;


procedure TfrmENInsulatorFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENInsulatorFilterObj.element = nil then ENInsulatorFilterObj.element := ENElement.Create();
               ENInsulatorFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENInsulatorFilterEdit.spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);
var 
   frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
begin
   frmENHighVoltageSellShow:=TfrmENHighVoltageSellShow.Create(Application,fmNormal);
   try
      with frmENHighVoltageSellShow do
        if ShowModal = mrOk then
        begin
            try
               if ENInsulatorFilterObj.highvoltageSell = nil then ENInsulatorFilterObj.highvoltageSell := ENHighVoltageSell.Create();
               ENInsulatorFilterObj.highvoltageSell.code := StrToInt(GetReturnValue(sgENHighVoltageSell,0));
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