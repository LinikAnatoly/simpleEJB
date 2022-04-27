
unit EditENBusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBusController ;

type
  TfrmENBusFilterEdit = class(TDialogForm)

    lblInsulatornumberGen : TLabel;
    edtInsulatornumberGen: TEdit;

    lblLength : TLabel;
    edtLength: TEdit;

    lblLocationScheme : TLabel;
    edtLocationScheme: TEdit;


  lblENInsulatorTypeInsulatorTypeName : TLabel;
  edtENInsulatorTypeInsulatorTypeName : TEdit;
  spbENInsulatorTypeInsulatorType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENHighVoltageSellHighvoltageSellName : TLabel;
  edtENHighVoltageSellHighvoltageSellName : TEdit;
  spbENHighVoltageSellHighvoltageSell : TSpeedButton;
  

  HTTPRIOENBus: THTTPRIO;

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
  frmENBusFilterEdit: TfrmENBusFilterEdit;
  ENBusFilterObj: ENBusFilter;

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
    EnergyproController, EnergyproController2, ENBusController  ;
}
{$R *.dfm}



procedure TfrmENBusFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtInsulatornumberGen
      ,edtLength
      ,edtLocationScheme
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENBusObj.insulatornumberGen <> nil ) then
       edtInsulatornumberGen.Text := ENBusObj.insulatornumberGen.decimalString
    else
       edtInsulatornumberGen.Text := ''; 



    if ( ENBusObj.length <> nil ) then
       edtLength.Text := ENBusObj.length.decimalString
    else
       edtLength.Text := ''; 



    edtLocationScheme.Text := ENBusObj.locationScheme; 


  end;

}

end;



procedure TfrmENBusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBus: ENBusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENBusFilterObj.insulatornumberGen = nil ) then
       ENBusFilterObj.insulatornumberGen := TXSDecimal.Create;
     if edtInsulatornumberGen.Text <> '' then
       ENBusFilterObj.insulatornumberGen.decimalString := edtInsulatornumberGen.Text 
     else
       ENBusFilterObj.insulatornumberGen := nil;




     if (ENBusFilterObj.length = nil ) then
       ENBusFilterObj.length := TXSDecimal.Create;
     if edtLength.Text <> '' then
       ENBusFilterObj.length.decimalString := edtLength.Text 
     else
       ENBusFilterObj.length := nil;




     ENBusFilterObj.locationScheme := edtLocationScheme.Text; 




  end;
end;

procedure TfrmENBusFilterEdit.spbENInsulatorTypeInsulatorTypeClick(Sender : TObject);
var 
   frmENInsulatorTypeShow: TfrmENInsulatorTypeShow;
begin
   frmENInsulatorTypeShow:=TfrmENInsulatorTypeShow.Create(Application,fmNormal);
   try
      with frmENInsulatorTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBusFilterObj.insulatorType = nil then ENBusFilterObj.insulatorType := ENInsulatorType.Create();
               ENBusFilterObj.insulatorType.code := StrToInt(GetReturnValue(sgENInsulatorType,0));
               edtENInsulatorTypeInsulatorTypeName.Text:=GetReturnValue(sgENInsulatorType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENInsulatorTypeShow.Free;
   end;
end;


procedure TfrmENBusFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBusFilterObj.element = nil then ENBusFilterObj.element := ENElement.Create();
               ENBusFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENBusFilterEdit.spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);
var 
   frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
begin
   frmENHighVoltageSellShow:=TfrmENHighVoltageSellShow.Create(Application,fmNormal);
   try
      with frmENHighVoltageSellShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBusFilterObj.highvoltageSell = nil then ENBusFilterObj.highvoltageSell := ENHighVoltageSell.Create();
               ENBusFilterObj.highvoltageSell.code := StrToInt(GetReturnValue(sgENHighVoltageSell,0));
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