
unit EditENLoadSwitchFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLoadSwitchController ;

type
  TfrmENLoadSwitchFilterEdit = class(TDialogForm)

    lblRatedVoltage : TLabel;
    edtRatedVoltage: TEdit;

    lblRatedCurrent : TLabel;
    edtRatedCurrent: TEdit;


  lblENLoadSwitchTypeLoadswitchTypeName : TLabel;
  edtENLoadSwitchTypeLoadswitchTypeName : TEdit;
  spbENLoadSwitchTypeLoadswitchType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENHighVoltageSellHighvoltageSellName : TLabel;
  edtENHighVoltageSellHighvoltageSellName : TEdit;
  spbENHighVoltageSellHighvoltageSell : TSpeedButton;
  

  HTTPRIOENLoadSwitch: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENLoadSwitchTypeLoadswitchTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENLoadSwitchFilterEdit: TfrmENLoadSwitchFilterEdit;
  ENLoadSwitchFilterObj: ENLoadSwitchFilter;

implementation

uses
  ShowENLoadSwitchType
  ,ENLoadSwitchTypeController
  ,ShowENElement
  ,ENElementController
  ,ShowENHighVoltageSell
  ,ENHighVoltageSellController
;

{uses  
    EnergyproController, EnergyproController2, ENLoadSwitchController  ;
}
{$R *.dfm}



procedure TfrmENLoadSwitchFilterEdit.FormShow(Sender: TObject);

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

    if ( ENLoadSwitchObj.ratedVoltage <> nil ) then
       edtRatedVoltage.Text := ENLoadSwitchObj.ratedVoltage.decimalString
    else
       edtRatedVoltage.Text := ''; 



    if ( ENLoadSwitchObj.ratedCurrent <> nil ) then
       edtRatedCurrent.Text := ENLoadSwitchObj.ratedCurrent.decimalString
    else
       edtRatedCurrent.Text := ''; 


  end;

}

end;



procedure TfrmENLoadSwitchFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENLoadSwitchFilterObj.ratedVoltage = nil ) then
       ENLoadSwitchFilterObj.ratedVoltage := TXSDecimal.Create;
     if edtRatedVoltage.Text <> '' then
       ENLoadSwitchFilterObj.ratedVoltage.decimalString := edtRatedVoltage.Text 
     else
       ENLoadSwitchFilterObj.ratedVoltage := nil;




     if (ENLoadSwitchFilterObj.ratedCurrent = nil ) then
       ENLoadSwitchFilterObj.ratedCurrent := TXSDecimal.Create;
     if edtRatedCurrent.Text <> '' then
       ENLoadSwitchFilterObj.ratedCurrent.decimalString := edtRatedCurrent.Text 
     else
       ENLoadSwitchFilterObj.ratedCurrent := nil;





  end;
end;

procedure TfrmENLoadSwitchFilterEdit.spbENLoadSwitchTypeLoadswitchTypeClick(Sender : TObject);
var 
   frmENLoadSwitchTypeShow: TfrmENLoadSwitchTypeShow;
begin
   frmENLoadSwitchTypeShow:=TfrmENLoadSwitchTypeShow.Create(Application,fmNormal);
   try
      with frmENLoadSwitchTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLoadSwitchFilterObj.loadswitchType = nil then ENLoadSwitchFilterObj.loadswitchType := ENLoadSwitchType.Create();
               ENLoadSwitchFilterObj.loadswitchType.code := StrToInt(GetReturnValue(sgENLoadSwitchType,0));
               edtENLoadSwitchTypeLoadswitchTypeName.Text:=GetReturnValue(sgENLoadSwitchType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENLoadSwitchTypeShow.Free;
   end;
end;


procedure TfrmENLoadSwitchFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLoadSwitchFilterObj.element = nil then ENLoadSwitchFilterObj.element := ENElement.Create();
               ENLoadSwitchFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENLoadSwitchFilterEdit.spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);
var 
   frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
begin
   frmENHighVoltageSellShow:=TfrmENHighVoltageSellShow.Create(Application,fmNormal);
   try
      with frmENHighVoltageSellShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLoadSwitchFilterObj.highvoltageSell = nil then ENLoadSwitchFilterObj.highvoltageSell := ENHighVoltageSell.Create();
               ENLoadSwitchFilterObj.highvoltageSell.code := StrToInt(GetReturnValue(sgENHighVoltageSell,0));
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