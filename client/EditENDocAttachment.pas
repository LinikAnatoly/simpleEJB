unit EditENDocAttachment;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENDocAttachmentController ;

type
  TfrmENDocAttachmentEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblFileLink : TLabel;
    edtFileLink: TEdit;
    lblFilesize : TLabel;
    edtFilesize: TEdit;
    lblUserAdd : TLabel;
    edtUserAdd: TEdit;
    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENDocAttachmentStatusStatusName : TLabel;
  edtENDocAttachmentStatusStatusName : TEdit;
  spbENDocAttachmentStatusStatus : TSpeedButton;
  
  lblENDocAttachmentTypeTypeRefName : TLabel;
  edtENDocAttachmentTypeTypeRefName : TEdit;
  spbENDocAttachmentTypeTypeRef : TSpeedButton;
  

    HTTPRIOENDocAttachment: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENDocAttachmentTypeTypeRefClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENDocAttachmentEdit: TfrmENDocAttachmentEdit;
  ENDocAttachmentObj: ENDocAttachment;

implementation

uses
  ENDocAttachmentStatusController
  ,ShowENDocAttachmentType
  ,ENDocAttachmentTypeController
;


{$R *.dfm}

procedure TfrmENDocAttachmentEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENDocAttachmentStatusStatusName
      ,spbENDocAttachmentStatusStatus
      ,edtENDocAttachmentTypeTypeRefName
      ,spbENDocAttachmentTypeTypeRef
       ]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtFileLink
      ,edtFilesize
      ,edtUserAdd
      ,edtDateAdd
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENDocAttachmentObj.code);
    edtCommentGen.Text := ENDocAttachmentObj.commentGen; 
    edtFileLink.Text := ENDocAttachmentObj.fileLink; 
    if ( ENDocAttachmentObj.filesize <> Low(Int64) ) then
       edtFilesize.Text := IntToStr(ENDocAttachmentObj.filesize)
    else
       edtFilesize.Text := '';
    edtUserAdd.Text := ENDocAttachmentObj.userAdd; 
    SetDateFieldForDateTimePicker(edtDateAdd, ENDocAttachmentObj.dateAdd);
    edtUserGen.Text := ENDocAttachmentObj.userGen; 
    SetDateFieldForDateTimePicker(edtDateEdit, ENDocAttachmentObj.dateEdit);

 //  edtENDocAttachmentStatusStatusName.Text := ENDocAttachmentObj.statusRef.name;
 //   edtENDocAttachmentTypeTypeRefName.Text := ENDocAttachmentObj.typeRef.name;
  end;
end;



procedure TfrmENDocAttachmentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDocAttachment: ENDocAttachmentControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtFileLink
      ,edtFilesize
      ,edtUserAdd
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

    ENDocAttachmentObj.commentGen := edtCommentGen.Text; 
    ENDocAttachmentObj.fileLink := edtFileLink.Text; 
    if ( edtFilesize.Text <> '' ) then
      ENDocAttachmentObj.filesize := StrToInt(edtFilesize.Text)
    else
      ENDocAttachmentObj.filesize := Low(Int64);
    ENDocAttachmentObj.userAdd := edtUserAdd.Text; 
    ENDocAttachmentObj.dateAdd := GetTXSDateTimeFromTDateTimePicker(edtDateAdd);	   
    ENDocAttachmentObj.userGen := edtUserGen.Text; 
    ENDocAttachmentObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtDateEdit);	   

    if DialogState = dsInsert then
    begin
      ENDocAttachmentObj.code := Low(Integer);
      TempENDocAttachment.add(ENDocAttachmentObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDocAttachment.save(ENDocAttachmentObj);
    end;
  end;
end;


procedure TfrmENDocAttachmentEdit.spbENDocAttachmentTypeTypeRefClick(Sender : TObject);
var 
   frmENDocAttachmentTypeShow: TfrmENDocAttachmentTypeShow;
begin
   frmENDocAttachmentTypeShow:=TfrmENDocAttachmentTypeShow.Create(Application,fmNormal);
   try
      with frmENDocAttachmentTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDocAttachmentObj.typeRef = nil then ENDocAttachmentObj.typeRef := ENDocAttachmentTypeRef.Create();
               ENDocAttachmentObj.typeRef.code := StrToInt(GetReturnValue(sgENDocAttachmentType,0));
               edtENDocAttachmentTypeTypeRefName.Text:=GetReturnValue(sgENDocAttachmentType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDocAttachmentTypeShow.Free;
   end;
end;


end.