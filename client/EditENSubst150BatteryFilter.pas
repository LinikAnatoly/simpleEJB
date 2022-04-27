
unit EditENSubst150BatteryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150BatteryController ;

type
  TfrmENSubst150BatteryFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;

    lblVoltage : TLabel;
    edtVoltage: TEdit;

    lblCapacity : TLabel;
    edtCapacity: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENSubst150Battery: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150BatteryFilterEdit: TfrmENSubst150BatteryFilterEdit;
  ENSubst150BatteryFilterObj: ENSubst150BatteryFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150BatteryController  ;
}
{$R *.dfm}



procedure TfrmENSubst150BatteryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENSubst150BatteryObj.name; 



    edtFactoryNumber.Text := ENSubst150BatteryObj.factoryNumber; 



    if ( ENSubst150BatteryObj.voltage <> nil ) then
       edtVoltage.Text := ENSubst150BatteryObj.voltage.decimalString
    else
       edtVoltage.Text := ''; 



    if ( ENSubst150BatteryObj.capacity <> nil ) then
       edtCapacity.Text := ENSubst150BatteryObj.capacity.decimalString
    else
       edtCapacity.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150BatteryObj.commentGen);



    edtUserGen.Text := ENSubst150BatteryObj.userGen; 



      if ENSubst150BatteryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150BatteryObj.dateEdit.Year,ENSubst150BatteryObj.dateEdit.Month,ENSubst150BatteryObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmENSubst150BatteryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150BatteryFilterObj.name := edtName.Text; 



     ENSubst150BatteryFilterObj.factoryNumber := edtFactoryNumber.Text; 



     if (ENSubst150BatteryFilterObj.voltage = nil ) then
       ENSubst150BatteryFilterObj.voltage := TXSDecimal.Create;
     if edtVoltage.Text <> '' then
       ENSubst150BatteryFilterObj.voltage.decimalString := edtVoltage.Text 
     else
       ENSubst150BatteryFilterObj.voltage := nil;




     if (ENSubst150BatteryFilterObj.capacity = nil ) then
       ENSubst150BatteryFilterObj.capacity := TXSDecimal.Create;
     if edtCapacity.Text <> '' then
       ENSubst150BatteryFilterObj.capacity.decimalString := edtCapacity.Text 
     else
       ENSubst150BatteryFilterObj.capacity := nil;




     ENSubst150BatteryFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150BatteryFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150BatteryFilterObj.dateEdit = nil then
          ENSubst150BatteryFilterObj.dateEdit := TXSDate.Create;
       ENSubst150BatteryFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150BatteryFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150BatteryFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150BatteryFilterObj.element = nil then ENSubst150BatteryFilterObj.element := ENElement.Create();
               ENSubst150BatteryFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.