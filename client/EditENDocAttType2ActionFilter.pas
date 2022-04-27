
unit EditENDocAttType2ActionFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDocAttType2ActionController ;

type
  TfrmENDocAttType2ActionFilterEdit = class(TDialogForm)


  lblENDocAttachmentTypeTypeRefName : TLabel;
  edtENDocAttachmentTypeTypeRefName : TEdit;
  spbENDocAttachmentTypeTypeRef : TSpeedButton;
  
  lblENDocAttachmentActionActionRefName : TLabel;
  edtENDocAttachmentActionActionRefName : TEdit;
  spbENDocAttachmentActionActionRef : TSpeedButton;
  

  HTTPRIOENDocAttType2Action: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDocAttachmentTypeTypeRefClick(Sender : TObject);
  procedure spbENDocAttachmentActionActionRefClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDocAttType2ActionFilterEdit: TfrmENDocAttType2ActionFilterEdit;
  ENDocAttType2ActionFilterObj: ENDocAttType2ActionFilter;

implementation

uses
  ShowENDocAttachmentType
  ,ENDocAttachmentTypeController
  ,ShowENDocAttachmentAction
  ,ENDocAttachmentActionController
;

{uses  
    EnergyproController, EnergyproController2, ENDocAttType2ActionController  ;
}
{$R *.dfm}



procedure TfrmENDocAttType2ActionFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENDocAttType2ActionFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;

procedure TfrmENDocAttType2ActionFilterEdit.spbENDocAttachmentTypeTypeRefClick(Sender : TObject);
var 
   frmENDocAttachmentTypeShow: TfrmENDocAttachmentTypeShow;
begin
   frmENDocAttachmentTypeShow:=TfrmENDocAttachmentTypeShow.Create(Application,fmNormal);
   try
      with frmENDocAttachmentTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDocAttType2ActionFilterObj.typeRef = nil then ENDocAttType2ActionFilterObj.typeRef := ENDocAttachmentTypeRef.Create();
               ENDocAttType2ActionFilterObj.typeRef.code := StrToInt(GetReturnValue(sgENDocAttachmentType,0));
               edtENDocAttachmentTypeTypeRefName.Text:=GetReturnValue(sgENDocAttachmentType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDocAttachmentTypeShow.Free;
   end;
end;


procedure TfrmENDocAttType2ActionFilterEdit.spbENDocAttachmentActionActionRefClick(Sender : TObject);
var 
   frmENDocAttachmentActionShow: TfrmENDocAttachmentActionShow;
begin
   frmENDocAttachmentActionShow:=TfrmENDocAttachmentActionShow.Create(Application,fmNormal);
   try
      with frmENDocAttachmentActionShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDocAttType2ActionFilterObj.actionRef = nil then ENDocAttType2ActionFilterObj.actionRef := ENDocAttachmentActionRef.Create();
               ENDocAttType2ActionFilterObj.actionRef.code := StrToInt(GetReturnValue(sgENDocAttachmentAction,0));
               edtENDocAttachmentActionActionRefName.Text:=GetReturnValue(sgENDocAttachmentAction,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDocAttachmentActionShow.Free;
   end;
end;





end.