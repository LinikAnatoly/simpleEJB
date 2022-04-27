
unit EditENSubst150SwitchFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150SwitchController ;

type
  TfrmENSubst150SwitchFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;

    lblCurrentNominal : TLabel;
    edtCurrentNominal: TEdit;

    lblCurrentDisconnection : TLabel;
    edtCurrentDisconnection: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENSubst150Switch: THTTPRIO;

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
  frmENSubst150SwitchFilterEdit: TfrmENSubst150SwitchFilterEdit;
  ENSubst150SwitchFilterObj: ENSubst150SwitchFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150SwitchController  ;
}
{$R *.dfm}



procedure TfrmENSubst150SwitchFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubst150SwitchObj.name; 



    edtFactoryNumber.Text := ENSubst150SwitchObj.factoryNumber; 



    if ( ENSubst150SwitchObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150SwitchObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := ''; 



    if ( ENSubst150SwitchObj.currentDisconnection <> nil ) then
       edtCurrentDisconnection.Text := ENSubst150SwitchObj.currentDisconnection.decimalString
    else
       edtCurrentDisconnection.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150SwitchObj.commentGen);



    edtUserGen.Text := ENSubst150SwitchObj.userGen; 



      if ENSubst150SwitchObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150SwitchObj.dateEdit.Year,ENSubst150SwitchObj.dateEdit.Month,ENSubst150SwitchObj.dateEdit.Day);
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



procedure TfrmENSubst150SwitchFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150Switch: ENSubst150SwitchControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150SwitchFilterObj.name := edtName.Text; 



     ENSubst150SwitchFilterObj.factoryNumber := edtFactoryNumber.Text; 



     if (ENSubst150SwitchFilterObj.currentNominal = nil ) then
       ENSubst150SwitchFilterObj.currentNominal := TXSDecimal.Create;
     if edtCurrentNominal.Text <> '' then
       ENSubst150SwitchFilterObj.currentNominal.decimalString := edtCurrentNominal.Text 
     else
       ENSubst150SwitchFilterObj.currentNominal := nil;




     if (ENSubst150SwitchFilterObj.currentDisconnection = nil ) then
       ENSubst150SwitchFilterObj.currentDisconnection := TXSDecimal.Create;
     if edtCurrentDisconnection.Text <> '' then
       ENSubst150SwitchFilterObj.currentDisconnection.decimalString := edtCurrentDisconnection.Text 
     else
       ENSubst150SwitchFilterObj.currentDisconnection := nil;




     ENSubst150SwitchFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150SwitchFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150SwitchFilterObj.dateEdit = nil then
          ENSubst150SwitchFilterObj.dateEdit := TXSDate.Create;
       ENSubst150SwitchFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150SwitchFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150SwitchFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150SwitchFilterObj.element = nil then ENSubst150SwitchFilterObj.element := ENElement.Create();
               ENSubst150SwitchFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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