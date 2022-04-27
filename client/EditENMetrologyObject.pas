
unit EditENMetrologyObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMetrologyObjectController ;

type
  TfrmENMetrologyObjectEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENMetrologyObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cbIS3Phase: TComboBox;
    cbISElectron: TComboBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMetrologyObjectEdit: TfrmENMetrologyObjectEdit;
  ENMetrologyObjectObj: ENMetrologyObject;

implementation

uses
  ShowENElement
  ,ENElementController
, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENMetrologyObjectController  ;
}
{$R *.dfm}



procedure TfrmENMetrologyObjectEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENMetrologyObjectObj.name;
    MakeMultiline(edtCommentGen.Lines, ENMetrologyObjectObj.commentGen);

    if ENMetrologyObjectObj.is3phase > LOW_INT then
      cbIS3Phase.ItemIndex :=  ENMetrologyObjectObj.is3phase
    else
      cbIS3Phase.ItemIndex := -1;

    if ENMetrologyObjectObj.isElectron > LOW_INT then
      cbISElectron.ItemIndex := ENMetrologyObjectObj.isElectron
    else
       cbISElectron.ItemIndex := -1;
    
    //edtENElementElementName.Text := ENMetrologyObjectObj.element.name;

  end;
end;



procedure TfrmENMetrologyObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

     if cbIS3Phase.ItemIndex = -1 then
     begin
        Application.MessageBox(PChar('Виберіть кількість Фаз ...'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
     end
     else
        ENMetrologyObjectObj.is3phase := cbIS3Phase.ItemIndex;

     if cbISElectron.ItemIndex = -1 then
     begin
        Application.MessageBox(PChar('Виберіть тип ...'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
     end
     else
        ENMetrologyObjectObj.isElectron := cbISElectron.ItemIndex;


    TempENMetrologyObject := HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;


     ENMetrologyObjectObj.name := edtName.Text;

     ENMetrologyObjectObj.commentGen := edtCommentGen.Text; 



    if DialogState = dsInsert then
    begin
      ENMetrologyObjectObj.code:=low(Integer);
      TempENMetrologyObject.add(ENMetrologyObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMetrologyObject.save(ENMetrologyObjectObj);
    end;
  end;
end;


procedure TfrmENMetrologyObjectEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
{
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMetrologyObjectObj.element = nil then ENMetrologyObjectObj.element := ENElement.Create();
               ENMetrologyObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
}   
end;



end.