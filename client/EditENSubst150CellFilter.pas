
unit EditENSubst150CellFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150CellController ;

type
  TfrmENSubst150CellFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENSubst150Cell: THTTPRIO;

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
  frmENSubst150CellFilterEdit: TfrmENSubst150CellFilterEdit;
  ENSubst150CellFilterObj: ENSubst150CellFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150CellController  ;
}
{$R *.dfm}



procedure TfrmENSubst150CellFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubst150CellObj.name; 



    edtFactoryNumber.Text := ENSubst150CellObj.factoryNumber; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150CellObj.commentGen);



    edtUserGen.Text := ENSubst150CellObj.userGen; 



      if ENSubst150CellObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150CellObj.dateEdit.Year,ENSubst150CellObj.dateEdit.Month,ENSubst150CellObj.dateEdit.Day);
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



procedure TfrmENSubst150CellFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150Cell: ENSubst150CellControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150CellFilterObj.name := edtName.Text; 



     ENSubst150CellFilterObj.factoryNumber := edtFactoryNumber.Text; 



     ENSubst150CellFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150CellFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150CellFilterObj.dateEdit = nil then
          ENSubst150CellFilterObj.dateEdit := TXSDate.Create;
       ENSubst150CellFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150CellFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150CellFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150CellFilterObj.element = nil then ENSubst150CellFilterObj.element := ENElement.Create();
               ENSubst150CellFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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