
unit EditRQOrgEmailsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrgEmailsController ;

type
  TfrmRQOrgEmailsFilterEdit = class(TDialogForm)

    lblEmail : TLabel;
    edtEmail: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQOrgEmails: THTTPRIO;

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
  frmRQOrgEmailsFilterEdit: TfrmRQOrgEmailsFilterEdit;
  RQOrgEmailsFilterObj: RQOrgEmailsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrgEmailsController  ;
}
{$R *.dfm}



procedure TfrmRQOrgEmailsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtEmail
      ,edtUserAdd
      ,edtDateAdd
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtEmail.Text := RQOrgEmailsObj.email; 



    MakeMultiline(edtCommentGen.Lines, RQOrgEmailsObj.commentGen);



    edtUserAdd.Text := RQOrgEmailsObj.userAdd; 



      if RQOrgEmailsObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(RQOrgEmailsObj.dateAdd.Year,RQOrgEmailsObj.dateAdd.Month,RQOrgEmailsObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := RQOrgEmailsObj.userGen; 



      if RQOrgEmailsObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQOrgEmailsObj.dateEdit.Year,RQOrgEmailsObj.dateEdit.Month,RQOrgEmailsObj.dateEdit.Day);
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



procedure TfrmRQOrgEmailsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQOrgEmailsFilterObj.email := edtEmail.Text; 



     RQOrgEmailsFilterObj.commentGen := edtCommentGen.Text; 



     RQOrgEmailsFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if RQOrgEmailsFilterObj.dateAdd = nil then
          RQOrgEmailsFilterObj.dateAdd := TXSDateTime.Create;
       RQOrgEmailsFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       RQOrgEmailsFilterObj.dateAdd := nil;



     RQOrgEmailsFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQOrgEmailsFilterObj.dateEdit = nil then
          RQOrgEmailsFilterObj.dateEdit := TXSDateTime.Create;
       RQOrgEmailsFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQOrgEmailsFilterObj.dateEdit := nil;




  end;
end;




end.