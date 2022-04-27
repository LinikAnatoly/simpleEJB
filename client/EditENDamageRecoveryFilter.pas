
unit EditENDamageRecoveryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDamageRecoveryController ;

type
  TfrmENDamageRecoveryFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblFKcontractCode : TLabel;
    edtFKcontractCode: TEdit;

    lblFKpartnerCode : TLabel;
    edtFKpartnerCode: TEdit;

    lblFKdocCode : TLabel;
    edtFKdocCode: TEdit;

    lblFKdocID : TLabel;
    edtFKdocID: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblContragentName : TLabel;
    edtContragentName: TEdit;

    lblContragentAddress : TLabel;
    edtContragentAddress: TMemo;

    lblContragentPassport : TLabel;
    edtContragentPassport: TMemo;

    lblDamageAmmount : TLabel;
    edtDamageAmmount: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENDamageRecovery: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDamageRecoveryFilterEdit: TfrmENDamageRecoveryFilterEdit;
  ENDamageRecoveryFilterObj: ENDamageRecoveryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDamageRecoveryController  ;
}
{$R *.dfm}



procedure TfrmENDamageRecoveryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtFKcontractCode
      ,edtFKpartnerCode
      ,edtFKdocCode
      ,edtFKdocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENDamageRecoveryObj.numberGen; 



      if ENDamageRecoveryObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENDamageRecoveryObj.dateGen.Year,ENDamageRecoveryObj.dateGen.Month,ENDamageRecoveryObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtFKcontractCode.Text := ENDamageRecoveryObj.FKcontractCode; 



    edtFKpartnerCode.Text := ENDamageRecoveryObj.FKpartnerCode; 



    edtFKdocCode.Text := ENDamageRecoveryObj.FKdocCode; 



    if ( ENDamageRecoveryObj.FKdocID <> Low(Integer) ) then
       edtFKdocID.Text := IntToStr(ENDamageRecoveryObj.FKdocID)
    else
       edtFKdocID.Text := '';



    MakeMultiline(edtCommentGen.Lines, ENDamageRecoveryObj.commentGen);



    edtContragentName.Text := ENDamageRecoveryObj.contragentName; 



    MakeMultiline(edtContragentAddress.Lines, ENDamageRecoveryObj.contragentAddress);



    MakeMultiline(edtContragentPassport.Lines, ENDamageRecoveryObj.contragentPassport);



    if ( ENDamageRecoveryObj.damageAmmount <> nil ) then
       edtDamageAmmount.Text := ENDamageRecoveryObj.damageAmmount.decimalString
    else
       edtDamageAmmount.Text := ''; 



    edtUserGen.Text := ENDamageRecoveryObj.userGen; 



      if ENDamageRecoveryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENDamageRecoveryObj.dateEdit.Year,ENDamageRecoveryObj.dateEdit.Month,ENDamageRecoveryObj.dateEdit.Day);
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



procedure TfrmENDamageRecoveryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENDamageRecovery: ENDamageRecoveryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDamageRecoveryFilterObj.numberGen := edtNumberGen.Text; 



     if edtdateGen.checked then
     begin 
       if ENDamageRecoveryFilterObj.dateGen = nil then
          ENDamageRecoveryFilterObj.dateGen := TXSDate.Create;
       ENDamageRecoveryFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENDamageRecoveryFilterObj.dateGen := nil;



     ENDamageRecoveryFilterObj.FKcontractCode := edtFKcontractCode.Text; 



     ENDamageRecoveryFilterObj.FKpartnerCode := edtFKpartnerCode.Text; 



     ENDamageRecoveryFilterObj.FKdocCode := edtFKdocCode.Text; 



     if ( edtFKdocID.Text <> '' ) then
       ENDamageRecoveryFilterObj.FKdocID := StrToInt(edtFKdocID.Text)
     else
       ENDamageRecoveryFilterObj.FKdocID := Low(Integer) ;




     ENDamageRecoveryFilterObj.commentGen := edtCommentGen.Text; 



     ENDamageRecoveryFilterObj.contragentName := edtContragentName.Text; 



     ENDamageRecoveryFilterObj.contragentAddress := edtContragentAddress.Text; 



     ENDamageRecoveryFilterObj.contragentPassport := edtContragentPassport.Text; 



     if (ENDamageRecoveryFilterObj.damageAmmount = nil ) then
       ENDamageRecoveryFilterObj.damageAmmount := TXSDecimal.Create;
     if edtDamageAmmount.Text <> '' then
       ENDamageRecoveryFilterObj.damageAmmount.decimalString := edtDamageAmmount.Text 
     else
       ENDamageRecoveryFilterObj.damageAmmount := nil;




     ENDamageRecoveryFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENDamageRecoveryFilterObj.dateEdit = nil then
          ENDamageRecoveryFilterObj.dateEdit := TXSDate.Create;
       ENDamageRecoveryFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENDamageRecoveryFilterObj.dateEdit := nil;




  end;
end;




end.