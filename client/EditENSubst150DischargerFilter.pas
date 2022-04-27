
unit EditENSubst150DischargerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150DischargerController ;

type
  TfrmENSubst150DischargerFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENSubst150Discharger: THTTPRIO;

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
  frmENSubst150DischargerFilterEdit: TfrmENSubst150DischargerFilterEdit;
  ENSubst150DischargerFilterObj: ENSubst150DischargerFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150DischargerController  ;
}
{$R *.dfm}



procedure TfrmENSubst150DischargerFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubst150DischargerObj.name; 



    edtFactoryNumber.Text := ENSubst150DischargerObj.factoryNumber; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150DischargerObj.commentGen);



    edtUserGen.Text := ENSubst150DischargerObj.userGen; 



      if ENSubst150DischargerObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150DischargerObj.dateEdit.Year,ENSubst150DischargerObj.dateEdit.Month,ENSubst150DischargerObj.dateEdit.Day);
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



procedure TfrmENSubst150DischargerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150DischargerFilterObj.name := edtName.Text; 



     ENSubst150DischargerFilterObj.factoryNumber := edtFactoryNumber.Text; 



     ENSubst150DischargerFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150DischargerFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150DischargerFilterObj.dateEdit = nil then
          ENSubst150DischargerFilterObj.dateEdit := TXSDate.Create;
       ENSubst150DischargerFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150DischargerFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150DischargerFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150DischargerFilterObj.element = nil then ENSubst150DischargerFilterObj.element := ENElement.Create();
               ENSubst150DischargerFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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