
unit EditENAct2DFDocDecreeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2DFDocDecreeController ;

type
  TfrmENAct2DFDocDecreeFilterEdit = class(TDialogForm)

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblDFDocDecreeCode : TLabel;
    edtDFDocDecreeCode: TEdit;

    lblDfDocCode : TLabel;
    edtDfDocCode: TEdit;



  HTTPRIOENAct2DFDocDecree: THTTPRIO;

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
  frmENAct2DFDocDecreeFilterEdit: TfrmENAct2DFDocDecreeFilterEdit;
  ENAct2DFDocDecreeFilterObj: ENAct2DFDocDecreeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAct2DFDocDecreeController  ;
}
{$R *.dfm}



procedure TfrmENAct2DFDocDecreeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserAdd
      ,edtDateAdd
      ,edtUserGen
      ,edtDateEdit
      ,edtDFDocDecreeCode
      ,edtDfDocCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtCommentGen.Lines, ENAct2DFDocDecreeObj.commentGen);



    edtUserAdd.Text := ENAct2DFDocDecreeObj.userAdd; 



      if ENAct2DFDocDecreeObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENAct2DFDocDecreeObj.dateAdd.Year,ENAct2DFDocDecreeObj.dateAdd.Month,ENAct2DFDocDecreeObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENAct2DFDocDecreeObj.userGen; 



      if ENAct2DFDocDecreeObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENAct2DFDocDecreeObj.dateEdit.Year,ENAct2DFDocDecreeObj.dateEdit.Month,ENAct2DFDocDecreeObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    if ( ENAct2DFDocDecreeObj.DFDocDecreeCode <> Low(Integer) ) then
       edtDFDocDecreeCode.Text := IntToStr(ENAct2DFDocDecreeObj.DFDocDecreeCode)
    else
       edtDFDocDecreeCode.Text := '';



    if ( ENAct2DFDocDecreeObj.dfDocCode <> Low(Integer) ) then
       edtDfDocCode.Text := IntToStr(ENAct2DFDocDecreeObj.dfDocCode)
    else
       edtDfDocCode.Text := '';


  end;

}

end;



procedure TfrmENAct2DFDocDecreeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAct2DFDocDecreeFilterObj.commentGen := edtCommentGen.Text; 



     ENAct2DFDocDecreeFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENAct2DFDocDecreeFilterObj.dateAdd = nil then
          ENAct2DFDocDecreeFilterObj.dateAdd := TXSDateTime.Create;
       ENAct2DFDocDecreeFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENAct2DFDocDecreeFilterObj.dateAdd := nil;



     ENAct2DFDocDecreeFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENAct2DFDocDecreeFilterObj.dateEdit = nil then
          ENAct2DFDocDecreeFilterObj.dateEdit := TXSDateTime.Create;
       ENAct2DFDocDecreeFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENAct2DFDocDecreeFilterObj.dateEdit := nil;



     if ( edtDFDocDecreeCode.Text <> '' ) then
       ENAct2DFDocDecreeFilterObj.DFDocDecreeCode := StrToInt(edtDFDocDecreeCode.Text)
     else
       ENAct2DFDocDecreeFilterObj.DFDocDecreeCode := Low(Integer) ;
	   



     if ( edtDfDocCode.Text <> '' ) then
       ENAct2DFDocDecreeFilterObj.dfDocCode := StrToInt(edtDfDocCode.Text)
     else
       ENAct2DFDocDecreeFilterObj.dfDocCode := Low(Integer) ;
	   




  end;
end;




end.