
unit EditENSubst150ShortCircuiterFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150ShortCircuiterController ;

type
  TfrmENSubst150ShortCircuiterFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENSubst150ShortCircuiter: THTTPRIO;

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
  frmENSubst150ShortCircuiterFilterEdit: TfrmENSubst150ShortCircuiterFilterEdit;
  ENSubst150ShortCircuiterFilterObj: ENSubst150ShortCircuiterFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150ShortCircuiterController  ;
}
{$R *.dfm}



procedure TfrmENSubst150ShortCircuiterFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubst150ShortCircuiterObj.name; 



    edtFactoryNumber.Text := ENSubst150ShortCircuiterObj.factoryNumber; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150ShortCircuiterObj.commentGen);



    edtUserGen.Text := ENSubst150ShortCircuiterObj.userGen; 



      if ENSubst150ShortCircuiterObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150ShortCircuiterObj.dateEdit.Year,ENSubst150ShortCircuiterObj.dateEdit.Month,ENSubst150ShortCircuiterObj.dateEdit.Day);
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



procedure TfrmENSubst150ShortCircuiterFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150ShortCircuiterFilterObj.name := edtName.Text; 



     ENSubst150ShortCircuiterFilterObj.factoryNumber := edtFactoryNumber.Text; 



     ENSubst150ShortCircuiterFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150ShortCircuiterFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150ShortCircuiterFilterObj.dateEdit = nil then
          ENSubst150ShortCircuiterFilterObj.dateEdit := TXSDate.Create;
       ENSubst150ShortCircuiterFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150ShortCircuiterFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150ShortCircuiterFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150ShortCircuiterFilterObj.element = nil then ENSubst150ShortCircuiterFilterObj.element := ENElement.Create();
               ENSubst150ShortCircuiterFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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