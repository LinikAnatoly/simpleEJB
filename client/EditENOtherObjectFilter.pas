
unit EditENOtherObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENOtherObjectController ;

type
  TfrmENOtherObjectFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblBuhName : TLabel;
    edtBuhName: TEdit;

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENOtherObject: THTTPRIO;

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
  frmENOtherObjectFilterEdit: TfrmENOtherObjectFilterEdit;
  ENOtherObjectFilterObj: ENOtherObjectFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENOtherObjectController  ;
}
{$R *.dfm}



procedure TfrmENOtherObjectFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENOtherObjectObj.name; 



    MakeMultiline(edtCommentGen.Lines, ENOtherObjectObj.commentGen);



    edtBuhName.Text := ENOtherObjectObj.buhName; 



    edtInvNumber.Text := ENOtherObjectObj.invNumber; 



    edtUserGen.Text := ENOtherObjectObj.userGen; 



      if ENOtherObjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENOtherObjectObj.dateEdit.Year,ENOtherObjectObj.dateEdit.Month,ENOtherObjectObj.dateEdit.Day);
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



procedure TfrmENOtherObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENOtherObject: ENOtherObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENOtherObjectFilterObj.name := edtName.Text; 



     ENOtherObjectFilterObj.commentGen := edtCommentGen.Text; 



     ENOtherObjectFilterObj.buhName := edtBuhName.Text; 



     ENOtherObjectFilterObj.invNumber := edtInvNumber.Text; 



     ENOtherObjectFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENOtherObjectFilterObj.dateEdit = nil then
          ENOtherObjectFilterObj.dateEdit := TXSDate.Create;
       ENOtherObjectFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENOtherObjectFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENOtherObjectFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENOtherObjectFilterObj.element = nil then ENOtherObjectFilterObj.element := ENElement.Create();
               ENOtherObjectFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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