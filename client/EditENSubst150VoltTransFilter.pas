
unit EditENSubst150VoltTransFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150VoltTransController ;

type
  TfrmENSubst150VoltTransFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENSubst150VoltTrans: THTTPRIO;

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
  frmENSubst150VoltTransFilterEdit: TfrmENSubst150VoltTransFilterEdit;
  ENSubst150VoltTransFilterObj: ENSubst150VoltTransFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150VoltTransController  ;
}
{$R *.dfm}



procedure TfrmENSubst150VoltTransFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubst150VoltTransObj.name; 



    edtFactoryNumber.Text := ENSubst150VoltTransObj.factoryNumber; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150VoltTransObj.commentGen);



    edtUserGen.Text := ENSubst150VoltTransObj.userGen; 



      if ENSubst150VoltTransObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150VoltTransObj.dateEdit.Year,ENSubst150VoltTransObj.dateEdit.Month,ENSubst150VoltTransObj.dateEdit.Day);
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



procedure TfrmENSubst150VoltTransFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150VoltTrans: ENSubst150VoltTransControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150VoltTransFilterObj.name := edtName.Text; 



     ENSubst150VoltTransFilterObj.factoryNumber := edtFactoryNumber.Text; 



     ENSubst150VoltTransFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150VoltTransFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150VoltTransFilterObj.dateEdit = nil then
          ENSubst150VoltTransFilterObj.dateEdit := TXSDate.Create;
       ENSubst150VoltTransFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150VoltTransFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150VoltTransFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150VoltTransFilterObj.element = nil then ENSubst150VoltTransFilterObj.element := ENElement.Create();
               ENSubst150VoltTransFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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