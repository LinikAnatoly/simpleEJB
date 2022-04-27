
unit EditSCUsageInputItemOZFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputItemOZController ;

type
  TfrmSCUsageInputItemOZFilterEdit = class(TDialogForm)

    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;

    lblNumberInt : TLabel;
    edtNumberInt: TEdit;

    lblCounterType : TLabel;
    edtCounterType: TEdit;

    lblAccount : TLabel;
    edtAccount: TEdit;

    lblCost : TLabel;
    edtCost: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblScCode : TLabel;
    edtScCode: TEdit;



  HTTPRIOSCUsageInputItemOZ: THTTPRIO;

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
  frmSCUsageInputItemOZFilterEdit: TfrmSCUsageInputItemOZFilterEdit;
  SCUsageInputItemOZFilterObj: SCUsageInputItemOZFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, SCUsageInputItemOZController  ;
}
{$R *.dfm}



procedure TfrmSCUsageInputItemOZFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtNumberInt
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberDoc.Text := SCUsageInputItemOZObj.numberDoc; 



    if ( SCUsageInputItemOZObj.numberInt <> Low(Integer) ) then
       edtNumberInt.Text := IntToStr(SCUsageInputItemOZObj.numberInt)
    else
       edtNumberInt.Text := '';



    edtCounterType.Text := SCUsageInputItemOZObj.counterType; 



    edtAccount.Text := SCUsageInputItemOZObj.account; 



    if ( SCUsageInputItemOZObj.cost <> nil ) then
       edtCost.Text := SCUsageInputItemOZObj.cost.decimalString
    else
       edtCost.Text := ''; 



    if ( SCUsageInputItemOZObj.countGen <> Low(Integer) ) then
       edtCountGen.Text := IntToStr(SCUsageInputItemOZObj.countGen)
    else
       edtCountGen.Text := '';



    if ( SCUsageInputItemOZObj.scCode <> Low(Integer) ) then
       edtScCode.Text := IntToStr(SCUsageInputItemOZObj.scCode)
    else
       edtScCode.Text := '';


  end;

}

end;



procedure TfrmSCUsageInputItemOZFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     SCUsageInputItemOZFilterObj.numberDoc := edtNumberDoc.Text; 



     if ( edtNumberInt.Text <> '' ) then
       SCUsageInputItemOZFilterObj.numberInt := StrToInt(edtNumberInt.Text)
     else
       SCUsageInputItemOZFilterObj.numberInt := Low(Integer) ;




     SCUsageInputItemOZFilterObj.counterType := edtCounterType.Text; 



     SCUsageInputItemOZFilterObj.account := edtAccount.Text; 



     if (SCUsageInputItemOZFilterObj.cost = nil ) then
       SCUsageInputItemOZFilterObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       SCUsageInputItemOZFilterObj.cost.decimalString := edtCost.Text 
     else
       SCUsageInputItemOZFilterObj.cost := nil;




     if ( edtCountGen.Text <> '' ) then
       SCUsageInputItemOZFilterObj.countGen := StrToInt(edtCountGen.Text)
     else
       SCUsageInputItemOZFilterObj.countGen := Low(Integer) ;




     if ( edtScCode.Text <> '' ) then
       SCUsageInputItemOZFilterObj.scCode := StrToInt(edtScCode.Text)
     else
       SCUsageInputItemOZFilterObj.scCode := Low(Integer) ;





  end;
end;




end.