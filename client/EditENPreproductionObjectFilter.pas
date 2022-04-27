
unit EditENPreproductionObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPreproductionObjectController ;

type
  TfrmENPreproductionObjectFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENPreproductionObject: THTTPRIO;

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
  frmENPreproductionObjectFilterEdit: TfrmENPreproductionObjectFilterEdit;
  ENPreproductionObjectFilterObj: ENPreproductionObjectFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENPreproductionObjectController  ;
}
{$R *.dfm}



procedure TfrmENPreproductionObjectFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPreproductionObjectObj.name; 



    MakeMultiline(edtCommentGen.Lines, ENPreproductionObjectObj.commentGen);



    edtUserGen.Text := ENPreproductionObjectObj.userGen; 



      if ENPreproductionObjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPreproductionObjectObj.dateEdit.Year,ENPreproductionObjectObj.dateEdit.Month,ENPreproductionObjectObj.dateEdit.Day);
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



procedure TfrmENPreproductionObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPreproductionObject: ENPreproductionObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPreproductionObjectFilterObj.name := edtName.Text; 



     ENPreproductionObjectFilterObj.commentGen := edtCommentGen.Text; 



     ENPreproductionObjectFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENPreproductionObjectFilterObj.dateEdit = nil then
          ENPreproductionObjectFilterObj.dateEdit := TXSDate.Create;
       ENPreproductionObjectFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPreproductionObjectFilterObj.dateEdit := nil;





  end;
end;

procedure TfrmENPreproductionObjectFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPreproductionObjectFilterObj.element = nil then ENPreproductionObjectFilterObj.element := ENElement.Create();
               ENPreproductionObjectFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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