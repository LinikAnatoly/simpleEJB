
unit EditENSO2NodeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2NodeController ;

type
  TfrmENSO2NodeFilterEdit = class(TDialogForm)

    lblCcNodeCode : TLabel;
    edtCcNodeCode: TEdit;

    lblPower : TLabel;
    edtPower: TEdit;

    lblDescription : TLabel;
    edtDescription: TEdit;

    lblIsCalc : TLabel;
    edtIsCalc: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSO2Node: THTTPRIO;

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
  frmENSO2NodeFilterEdit: TfrmENSO2NodeFilterEdit;
  ENSO2NodeFilterObj: ENSO2NodeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSO2NodeController  ;
}
{$R *.dfm}



procedure TfrmENSO2NodeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCcNodeCode
      ,edtDescription
      ,edtIsCalc
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENSO2NodeObj.ccNodeCode <> Low(Integer) ) then
       edtCcNodeCode.Text := IntToStr(ENSO2NodeObj.ccNodeCode)
    else
       edtCcNodeCode.Text := '';



    if ( ENSO2NodeObj.power <> nil ) then
       edtPower.Text := ENSO2NodeObj.power.decimalString
    else
       edtPower.Text := ''; 



    edtDescription.Text := ENSO2NodeObj.description; 



    if ( ENSO2NodeObj.isCalc <> Low(Integer) ) then
       edtIsCalc.Text := IntToStr(ENSO2NodeObj.isCalc)
    else
       edtIsCalc.Text := '';



    edtUserGen.Text := ENSO2NodeObj.userGen; 



      if ENSO2NodeObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSO2NodeObj.dateEdit.Year,ENSO2NodeObj.dateEdit.Month,ENSO2NodeObj.dateEdit.Day);
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



procedure TfrmENSO2NodeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2Node: ENSO2NodeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtCcNodeCode.Text <> '' ) then
       ENSO2NodeFilterObj.ccNodeCode := StrToInt(edtCcNodeCode.Text)
     else
       ENSO2NodeFilterObj.ccNodeCode := Low(Integer) ;
	   



     if (ENSO2NodeFilterObj.power = nil ) then
       ENSO2NodeFilterObj.power := TXSDecimal.Create;
     if edtPower.Text <> '' then
       ENSO2NodeFilterObj.power.decimalString := edtPower.Text 
     else
       ENSO2NodeFilterObj.power := nil;




     ENSO2NodeFilterObj.description := edtDescription.Text; 



     if ( edtIsCalc.Text <> '' ) then
       ENSO2NodeFilterObj.isCalc := StrToInt(edtIsCalc.Text)
     else
       ENSO2NodeFilterObj.isCalc := Low(Integer) ;
	   



     ENSO2NodeFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSO2NodeFilterObj.dateEdit = nil then
          ENSO2NodeFilterObj.dateEdit := TXSDateTime.Create;
       ENSO2NodeFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSO2NodeFilterObj.dateEdit := nil;




  end;
end;




end.