
unit EditENSchemeAttachmentFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSchemeAttachmentController ;

type
  TfrmENSchemeAttachmentFilterEdit = class(TDialogForm)

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

    lblAttachmentDate : TLabel;
    edtAttachmentDate: TDateTimePicker;
    lblSchemeFile : TLabel;
    edtSchemeFile: TEdit;

    lblSchemeName : TLabel;
    edtSchemeName: TEdit;

    lblSchemeExt : TLabel;
    edtSchemeExt: TEdit;

    lblIsPacked : TLabel;
    edtIsPacked: TEdit;



  HTTPRIOENSchemeAttachment: THTTPRIO;

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
  frmENSchemeAttachmentFilterEdit: TfrmENSchemeAttachmentFilterEdit;
  ENSchemeAttachmentFilterObj: ENSchemeAttachmentFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSchemeAttachmentController  ;
}
{$R *.dfm}



procedure TfrmENSchemeAttachmentFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtIsPacked
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtUserGen.Text := ENSchemeAttachmentObj.userGen; 



    edtCommentGen.Text := ENSchemeAttachmentObj.commentGen; 



      if ENSchemeAttachmentObj.attachmentDate <> nil then
      begin
        edtAttachmentDate.DateTime:=EncodeDate(ENSchemeAttachmentObj.attachmentDate.Year,ENSchemeAttachmentObj.attachmentDate.Month,ENSchemeAttachmentObj.attachmentDate.Day);
        edtAttachmentDate.checked := true;
      end
      else
      begin
        edtAttachmentDate.DateTime:=SysUtils.Date;
        edtAttachmentDate.checked := false;
      end;



    edtSchemeFile.Text := ENSchemeAttachmentObj.schemeFile; 



    edtSchemeName.Text := ENSchemeAttachmentObj.schemeName; 



    edtSchemeExt.Text := ENSchemeAttachmentObj.schemeExt; 



    if ( ENSchemeAttachmentObj.isPacked <> Low(Integer) ) then
       edtIsPacked.Text := IntToStr(ENSchemeAttachmentObj.isPacked)
    else
       edtIsPacked.Text := '';


  end;

}

end;



procedure TfrmENSchemeAttachmentFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSchemeAttachment: ENSchemeAttachmentControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSchemeAttachmentFilterObj.userGen := edtUserGen.Text; 



     ENSchemeAttachmentFilterObj.commentGen := edtCommentGen.Text; 



     if edtattachmentDate.checked then
     begin 
       if ENSchemeAttachmentFilterObj.attachmentDate = nil then
          ENSchemeAttachmentFilterObj.attachmentDate := TXSDate.Create;
       ENSchemeAttachmentFilterObj.attachmentDate.XSToNative(GetXSDate(edtattachmentDate.DateTime));
     end
     else
       ENSchemeAttachmentFilterObj.attachmentDate := nil;

     //ENSchemeAttachmentFilterObj.schemeFile := edtSchemeFile.Text;

     ENSchemeAttachmentFilterObj.schemeName := edtSchemeName.Text; 



     ENSchemeAttachmentFilterObj.schemeExt := edtSchemeExt.Text; 



     if ( edtIsPacked.Text <> '' ) then
       ENSchemeAttachmentFilterObj.isPacked := StrToInt(edtIsPacked.Text)
     else
       ENSchemeAttachmentFilterObj.isPacked := Low(Integer) ;





  end;
end;




end.