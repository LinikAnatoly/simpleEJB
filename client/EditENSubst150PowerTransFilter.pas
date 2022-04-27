
unit EditENSubst150PowerTransFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150PowerTransController ;

type
  TfrmENSubst150PowerTransFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;

    lblVoltageVN : TLabel;
    edtVoltageVN: TEdit;

    lblVoltageSN : TLabel;
    edtVoltageSN: TEdit;

    lblVoltageNN : TLabel;
    edtVoltageNN: TEdit;

    lblCurrentVN : TLabel;
    edtCurrentVN: TEdit;

    lblCurrentSN : TLabel;
    edtCurrentSN: TEdit;

    lblCurrentNN : TLabel;
    edtCurrentNN: TEdit;

    lblPowerVN : TLabel;
    edtPowerVN: TEdit;

    lblPowerSN : TLabel;
    edtPowerSN: TEdit;

    lblPowerNN : TLabel;
    edtPowerNN: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENSubst150PowerTrans: THTTPRIO;

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
  frmENSubst150PowerTransFilterEdit: TfrmENSubst150PowerTransFilterEdit;
  ENSubst150PowerTransFilterObj: ENSubst150PowerTransFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150PowerTransController  ;
}
{$R *.dfm}



procedure TfrmENSubst150PowerTransFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubst150PowerTransObj.name; 



    edtFactoryNumber.Text := ENSubst150PowerTransObj.factoryNumber; 



    if ( ENSubst150PowerTransObj.voltageVN <> nil ) then
       edtVoltageVN.Text := ENSubst150PowerTransObj.voltageVN.decimalString
    else
       edtVoltageVN.Text := ''; 



    if ( ENSubst150PowerTransObj.voltageSN <> nil ) then
       edtVoltageSN.Text := ENSubst150PowerTransObj.voltageSN.decimalString
    else
       edtVoltageSN.Text := ''; 



    if ( ENSubst150PowerTransObj.voltageNN <> nil ) then
       edtVoltageNN.Text := ENSubst150PowerTransObj.voltageNN.decimalString
    else
       edtVoltageNN.Text := ''; 



    if ( ENSubst150PowerTransObj.currentVN <> nil ) then
       edtCurrentVN.Text := ENSubst150PowerTransObj.currentVN.decimalString
    else
       edtCurrentVN.Text := ''; 



    if ( ENSubst150PowerTransObj.currentSN <> nil ) then
       edtCurrentSN.Text := ENSubst150PowerTransObj.currentSN.decimalString
    else
       edtCurrentSN.Text := ''; 



    if ( ENSubst150PowerTransObj.currentNN <> nil ) then
       edtCurrentNN.Text := ENSubst150PowerTransObj.currentNN.decimalString
    else
       edtCurrentNN.Text := ''; 



    if ( ENSubst150PowerTransObj.powerVN <> nil ) then
       edtPowerVN.Text := ENSubst150PowerTransObj.powerVN.decimalString
    else
       edtPowerVN.Text := ''; 



    if ( ENSubst150PowerTransObj.powerSN <> nil ) then
       edtPowerSN.Text := ENSubst150PowerTransObj.powerSN.decimalString
    else
       edtPowerSN.Text := ''; 



    if ( ENSubst150PowerTransObj.powerNN <> nil ) then
       edtPowerNN.Text := ENSubst150PowerTransObj.powerNN.decimalString
    else
       edtPowerNN.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150PowerTransObj.commentGen);



    edtUserGen.Text := ENSubst150PowerTransObj.userGen; 



      if ENSubst150PowerTransObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150PowerTransObj.dateEdit.Year,ENSubst150PowerTransObj.dateEdit.Month,ENSubst150PowerTransObj.dateEdit.Day);
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



procedure TfrmENSubst150PowerTransFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150PowerTransFilterObj.name := edtName.Text; 



     ENSubst150PowerTransFilterObj.factoryNumber := edtFactoryNumber.Text; 



     if (ENSubst150PowerTransFilterObj.voltageVN = nil ) then
       ENSubst150PowerTransFilterObj.voltageVN := TXSDecimal.Create;
     if edtVoltageVN.Text <> '' then
       ENSubst150PowerTransFilterObj.voltageVN.decimalString := edtVoltageVN.Text 
     else
       ENSubst150PowerTransFilterObj.voltageVN := nil;




     if (ENSubst150PowerTransFilterObj.voltageSN = nil ) then
       ENSubst150PowerTransFilterObj.voltageSN := TXSDecimal.Create;
     if edtVoltageSN.Text <> '' then
       ENSubst150PowerTransFilterObj.voltageSN.decimalString := edtVoltageSN.Text 
     else
       ENSubst150PowerTransFilterObj.voltageSN := nil;




     if (ENSubst150PowerTransFilterObj.voltageNN = nil ) then
       ENSubst150PowerTransFilterObj.voltageNN := TXSDecimal.Create;
     if edtVoltageNN.Text <> '' then
       ENSubst150PowerTransFilterObj.voltageNN.decimalString := edtVoltageNN.Text 
     else
       ENSubst150PowerTransFilterObj.voltageNN := nil;




     if (ENSubst150PowerTransFilterObj.currentVN = nil ) then
       ENSubst150PowerTransFilterObj.currentVN := TXSDecimal.Create;
     if edtCurrentVN.Text <> '' then
       ENSubst150PowerTransFilterObj.currentVN.decimalString := edtCurrentVN.Text 
     else
       ENSubst150PowerTransFilterObj.currentVN := nil;




     if (ENSubst150PowerTransFilterObj.currentSN = nil ) then
       ENSubst150PowerTransFilterObj.currentSN := TXSDecimal.Create;
     if edtCurrentSN.Text <> '' then
       ENSubst150PowerTransFilterObj.currentSN.decimalString := edtCurrentSN.Text 
     else
       ENSubst150PowerTransFilterObj.currentSN := nil;




     if (ENSubst150PowerTransFilterObj.currentNN = nil ) then
       ENSubst150PowerTransFilterObj.currentNN := TXSDecimal.Create;
     if edtCurrentNN.Text <> '' then
       ENSubst150PowerTransFilterObj.currentNN.decimalString := edtCurrentNN.Text 
     else
       ENSubst150PowerTransFilterObj.currentNN := nil;




     if (ENSubst150PowerTransFilterObj.powerVN = nil ) then
       ENSubst150PowerTransFilterObj.powerVN := TXSDecimal.Create;
     if edtPowerVN.Text <> '' then
       ENSubst150PowerTransFilterObj.powerVN.decimalString := edtPowerVN.Text 
     else
       ENSubst150PowerTransFilterObj.powerVN := nil;




     if (ENSubst150PowerTransFilterObj.powerSN = nil ) then
       ENSubst150PowerTransFilterObj.powerSN := TXSDecimal.Create;
     if edtPowerSN.Text <> '' then
       ENSubst150PowerTransFilterObj.powerSN.decimalString := edtPowerSN.Text 
     else
       ENSubst150PowerTransFilterObj.powerSN := nil;




     if (ENSubst150PowerTransFilterObj.powerNN = nil ) then
       ENSubst150PowerTransFilterObj.powerNN := TXSDecimal.Create;
     if edtPowerNN.Text <> '' then
       ENSubst150PowerTransFilterObj.powerNN.decimalString := edtPowerNN.Text 
     else
       ENSubst150PowerTransFilterObj.powerNN := nil;




     ENSubst150PowerTransFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150PowerTransFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150PowerTransFilterObj.dateEdit = nil then
          ENSubst150PowerTransFilterObj.dateEdit := TXSDate.Create;
       ENSubst150PowerTransFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150PowerTransFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150PowerTransFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150PowerTransFilterObj.element = nil then ENSubst150PowerTransFilterObj.element := ENElement.Create();
               ENSubst150PowerTransFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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