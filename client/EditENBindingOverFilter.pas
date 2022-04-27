
unit EditENBindingOverFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBindingOverController ;

type
  TfrmENBindingOverFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblItemText : TLabel;
    edtItemText: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENBindingOverOrganizationOrganizationName : TLabel;
  edtENBindingOverOrganizationOrganizationName : TEdit;
  spbENBindingOverOrganizationOrganization : TSpeedButton;
  

  HTTPRIOENBindingOver: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENBindingOverOrganizationOrganizationClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBindingOverFilterEdit: TfrmENBindingOverFilterEdit;
  ENBindingOverFilterObj: ENBindingOverFilter;

implementation

uses
  ShowENBindingOverOrganization
  ,ENBindingOverOrganizationController
;

{uses  
    EnergyproController, EnergyproController2, ENBindingOverController  ;
}
{$R *.dfm}



procedure TfrmENBindingOverFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtItemText
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENBindingOverObj.numberGen; 



      if ENBindingOverObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENBindingOverObj.dateGen.Year,ENBindingOverObj.dateGen.Month,ENBindingOverObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtItemText.Text := ENBindingOverObj.itemText; 



    MakeMultiline(edtCommentGen.Lines, ENBindingOverObj.commentGen);



    edtUserGen.Text := ENBindingOverObj.userGen; 



      if ENBindingOverObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENBindingOverObj.dateEdit.Year,ENBindingOverObj.dateEdit.Month,ENBindingOverObj.dateEdit.Day);
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



procedure TfrmENBindingOverFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBindingOver: ENBindingOverControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBindingOverFilterObj.numberGen := edtNumberGen.Text; 



     if edtdateGen.checked then
     begin 
       if ENBindingOverFilterObj.dateGen = nil then
          ENBindingOverFilterObj.dateGen := TXSDate.Create;
       ENBindingOverFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENBindingOverFilterObj.dateGen := nil;




     ENBindingOverFilterObj.itemText := edtItemText.Text; 



     ENBindingOverFilterObj.commentGen := edtCommentGen.Text; 



     ENBindingOverFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENBindingOverFilterObj.dateEdit = nil then
          ENBindingOverFilterObj.dateEdit := TXSDate.Create;
       ENBindingOverFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENBindingOverFilterObj.dateEdit := nil;





  end;
end;

procedure TfrmENBindingOverFilterEdit.spbENBindingOverOrganizationOrganizationClick(Sender : TObject);
var 
   frmENBindingOverOrganizationShow: TfrmENBindingOverOrganizationShow;
begin
   frmENBindingOverOrganizationShow:=TfrmENBindingOverOrganizationShow.Create(Application,fmNormal);
   try
      with frmENBindingOverOrganizationShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBindingOverFilterObj.organization = nil then ENBindingOverFilterObj.organization := ENBindingOverOrganization.Create();
               ENBindingOverFilterObj.organization.code := StrToInt(GetReturnValue(sgENBindingOverOrganization,0));
               edtENBindingOverOrganizationOrganizationName.Text:=GetReturnValue(sgENBindingOverOrganization,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENBindingOverOrganizationShow.Free;
   end;
end;





end.