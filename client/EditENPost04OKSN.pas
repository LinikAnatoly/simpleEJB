
unit EditENPost04OKSN;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPost04OKSNController ;

type
  TfrmENPost04OKSNEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblPostNumber : TLabel;
    edtPostNumber: TEdit;
    lblNumberOfCables : TLabel;
    edtNumberOfCables: TEdit;

  lblENPostTypePostTtypeName : TLabel;
  edtENPostTypePostTtypeName : TEdit;
  spbENPostTypePostTtype : TSpeedButton;
  

  HTTPRIOENPost04OKSN: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    upDwnPostQuantity: TUpDown;
    edtPostQuantity: TEdit;
    chbCopy: TCheckBox;
    lblBranchLineName: TLabel;
    edtBranchLineName: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPostTypePostTtypeClick(Sender : TObject);
    procedure chbCopyClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPost04OKSNEdit: TfrmENPost04OKSNEdit;
  ENPost04OKSNObj: ENPost04OKSN;

implementation

uses
  ShowENPostType
  ,ENPostTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENPost04OKSNController  ;
}
{$R *.dfm}



procedure TfrmENPost04OKSNEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENPostTypePostTtypeName
      ,spbENPostTypePostTtype
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPostNumber
      ,edtNumberOfCables
      ,edtBranchLineName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENPost04OKSNObj.code);
    edtPostNumber.Text := ENPost04OKSNObj.postNumber;
    if ( ENPost04OKSNObj.numberOfCables <> Low(Integer) ) then
       edtNumberOfCables.Text := IntToStr(ENPost04OKSNObj.numberOfCables)
    else
       edtNumberOfCables.Text := '';

    edtBranchLineName.Text := ENPost04OKSNObj.branchLineName;
    edtENPostTypePostTtypeName.Text := ENPost04OKSNObj.postTtype.name;

  end;
end;



procedure TfrmENPost04OKSNEdit.chbCopyClick(Sender: TObject);
begin
  inherited;
  edtPostQuantity.Visible := chbCopy.Checked;
  upDwnPostQuantity.Visible := chbCopy.Checked;
  if chbCopy.Checked then
    edtPostQuantity.SetFocus;
end;

procedure TfrmENPost04OKSNEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
postCnt, i, postNumber : Integer;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtPostNumber
      ,edtNumberOfCables
      ,edtBranchLineName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPost04OKSN := HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;


     ENPost04OKSNObj.postNumber := edtPostNumber.Text; 

     if ( edtNumberOfCables.Text <> '' ) then
       ENPost04OKSNObj.numberOfCables := StrToInt(edtNumberOfCables.Text)
     else
       ENPost04OKSNObj.numberOfCables := Low(Integer) ;

    ENPost04OKSNObj.branchLineName := edtBranchLineName.Text;

       postCnt := 0;
      if (chbCopy.Checked) and (edtPostQuantity.Text <> '') then
        postCnt := StrToInt(edtPostQuantity.Text);

    if DialogState = dsInsert then
    begin
      if postCnt > 0 then
      begin
         postNumber := 0;
          if edtPostNumber.Text <> '' then
            if IsIntValue(edtPostNumber) then
              postNumber := StrToInt(edtPostNumber.Text);
          for i := 1 to postCnt do
            begin
              if postNumber > 0 then
                ENPost04OKSNObj.postNumber := IntToStr(postNumber);
              if i > 1 then
              ENPost04OKSNObj.code := low(Integer);
              TempENPost04OKSN.add(ENPost04OKSNObj);
              postNumber := postNumber + 1;
            end;
      end
      else

      begin
       ENPost04OKSNObj.code:=low(Integer);
       TempENPost04OKSN.add(ENPost04OKSNObj);
      end;
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPost04OKSN.save(ENPost04OKSNObj);
    end;

  end;
end;


procedure TfrmENPost04OKSNEdit.spbENPostTypePostTtypeClick(Sender : TObject);
var 
   frmENPostTypeShow: TfrmENPostTypeShow;
begin
   frmENPostTypeShow:=TfrmENPostTypeShow.Create(Application,fmNormal);
   try
      with frmENPostTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPost04OKSNObj.postTtype = nil then ENPost04OKSNObj.postTtype := ENPostType.Create();
               ENPost04OKSNObj.postTtype.code := StrToInt(GetReturnValue(sgENPostType,0));
               edtENPostTypePostTtypeName.Text:=GetReturnValue(sgENPostType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPostTypeShow.Free;
   end;
end;



end.
