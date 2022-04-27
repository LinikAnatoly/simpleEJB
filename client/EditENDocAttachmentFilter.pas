
unit EditENDocAttachmentFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDocAttachmentController ;

type
  TfrmENDocAttachmentFilterEdit = class(TDialogForm)

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
  frmENDocAttachmentFilterEdit: TfrmENDocAttachmentFilterEdit;
  ENDocAttachmentFilterObj: ENDocAttachmentFilter;

implementation

uses
  ENDocAttachmentStatusController
  ,ShowENDocAttachmentType
  ,ENDocAttachmentTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENDocAttachmentController  ;
}
{$R *.dfm}



procedure TfrmENDocAttachmentFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFileLink
      ,edtFilesize
      ,edtUserAdd
      ,edtDateAdd
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtCommentGen.Text := ENDocAttachmentObj.commentGen; 



    edtFileLink.Text := ENDocAttachmentObj.fileLink; 



    if ( ENDocAttachmentObj.filesize <> Low(Int64) ) then
       edtFilesize.Text := IntToStr(ENDocAttachmentObj.filesize)
    else
       edtFilesize.Text := '';



    edtUserAdd.Text := ENDocAttachmentObj.userAdd; 



      if ENDocAttachmentObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENDocAttachmentObj.dateAdd.Year,ENDocAttachmentObj.dateAdd.Month,ENDocAttachmentObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENDocAttachmentObj.userGen; 



      if ENDocAttachmentObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENDocAttachmentObj.dateEdit.Year,ENDocAttachmentObj.dateEdit.Month,ENDocAttachmentObj.dateEdit.Day);
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



procedure TfrmENDocAttachmentFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDocAttachment: ENDocAttachmentControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDocAttachmentFilterObj.commentGen := edtCommentGen.Text; 



     ENDocAttachmentFilterObj.fileLink := edtFileLink.Text; 



     if ( edtFilesize.Text <> '' ) then
       ENDocAttachmentFilterObj.filesize := StrToInt(edtFilesize.Text)
     else
       ENDocAttachmentFilterObj.filesize := Low(Int64) ;




     ENDocAttachmentFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENDocAttachmentFilterObj.dateAdd = nil then
          ENDocAttachmentFilterObj.dateAdd := TXSDateTime.Create;
       ENDocAttachmentFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENDocAttachmentFilterObj.dateAdd := nil;



     ENDocAttachmentFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENDocAttachmentFilterObj.dateEdit = nil then
          ENDocAttachmentFilterObj.dateEdit := TXSDateTime.Create;
       ENDocAttachmentFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENDocAttachmentFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENDocAttachmentFilterEdit.spbENDocAttachmentTypeTypeRefClick(Sender : TObject);
var 
   frmENDocAttachmentTypeShow: TfrmENDocAttachmentTypeShow;
begin
   frmENDocAttachmentTypeShow:=TfrmENDocAttachmentTypeShow.Create(Application,fmNormal);
   try
      with frmENDocAttachmentTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDocAttachmentFilterObj.typeRef = nil then ENDocAttachmentFilterObj.typeRef := ENDocAttachmentTypeRef.Create();
               ENDocAttachmentFilterObj.typeRef.code := StrToInt(GetReturnValue(sgENDocAttachmentType,0));
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