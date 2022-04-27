
unit EditENBranch10;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENBranch10Controller ;

type
    TfrmENBranch10Edit = class(TDialogForm)
    lblCode: TLabel;
    edtCode: TEdit;
    lblName: TLabel;
    edtName: TEdit;
    lblBranchLength : TLabel;
    edtBranchLength: TEdit;
    lblDispOffName : TLabel;
    edtDispOffName: TEdit;
    HTTPRIOENBranch10: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblPostNumber: TLabel;
    edtPostNumber: TEdit;
    spbENPost: TSpeedButton;
    HTTPRIOENPost_s: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENPostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var frmENBranch10Edit: TfrmENBranch10Edit;
  ENBranch10Obj: ENBranch10;
  codeLine10: Integer;

implementation

uses ENPostController, ShowENPost, EditENPost, EditENPostFilter,
  ENElementController, Math;

{$R *.dfm}

procedure TfrmENBranch10Edit.FormShow(Sender: TObject);
var TempENPost: ENPostControllerSoapPort; postObj: ENPost;
begin
  SetFloatStyle([edtBranchLength]);
  DisableControls([edtPostNumber]);
  if DialogState = dsView then
    DisableControls([spbENPost]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtBranchLength
      ,edtDispOffName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENBranch10Obj.code);
    edtName.Text := ENBranch10Obj.name;
    if ( ENBranch10Obj.branchLength <> nil ) then
       edtBranchLength.Text := ENBranch10Obj.branchLength.decimalString
    else
       edtBranchLength.Text := ''; 
    edtDispOffName.Text := ENBranch10Obj.dispOffName;

    if ENBranch10Obj.postOutRef <> nil then
      if ENBranch10Obj.postOutRef.code <> low(integer) then
        begin
          TempENPost := HTTPRIOENPost_s as ENPostControllerSoapPort;
          postObj := TempENPost.getObject(ENBranch10Obj.postOutRef.code);
          try
            edtPostNumber.Text := 'Опора № ' + postObj.postNumberGen;
          finally
            postObj.Free;
            postObj := nil;
          end;
        end;

  end;
end;



procedure TfrmENBranch10Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBranch10: ENBranch10ControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtBranchLength
      ,edtDispOffName
      ,edtPostNumber
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBranch10 := HTTPRIOENBranch10 as ENBranch10ControllerSoapPort;


     ENBranch10Obj.name := edtName.Text; 

     if (ENBranch10Obj.branchLength = nil ) then
       ENBranch10Obj.branchLength := TXSDecimal.Create;
     if edtBranchLength.Text <> '' then
       ENBranch10Obj.branchLength.decimalString := edtBranchLength.Text 
     else
       ENBranch10Obj.branchLength := nil;

     ENBranch10Obj.dispOffName := edtDispOffName.Text;

    if DialogState = dsInsert then
    begin
      ENBranch10Obj.code:=low(Integer);
      TempENBranch10.add(ENBranch10Obj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBranch10.save(ENBranch10Obj);
    end;
  end;
end;


procedure TfrmENBranch10Edit.spbENPostClick(Sender: TObject);
var
  tmpENPost: ENPostControllerSoapPort;
  postOutRefCode: Integer;
  postOutObj: ENPost;
  frmENPostShow: TfrmENPostShow;
  postFilter: ENPostFilter;
begin

  postFilter := ENPostFilter.Create;
  SetNullIntProps(postFilter);
  SetNullXSProps(postFilter);
  postFilter.conditionSQL :=
    ' ENPOST.LINE10REFCODE = ' + IntToStr(codeLine10)
    + ' AND ENPOST.CODE NOT IN (SELECT ENBRANCH10ITEM.POSTCODE '
    + '   FROM ENBRANCH10ITEM WHERE ENBRANCH10ITEM.BRANCH10REFCODE IN '
    + '     (SELECT ENBRANCH10.CODE FROM ENBRANCH10 '
    + '       WHERE LINE10REFCODE = ' + IntToStr(codeLine10) + '))';


  frmENPostShow := TfrmENPostShow.Create(Application, fmNormal, postFilter);
  try
    with frmENPostShow do
      begin
        if ShowModal = mrOk then
          begin
            try
              if ENBranch10Obj.postOutRef = nil then
                ENBranch10Obj.postOutRef := ENPostRef.Create();
              postOutRefCode := StrToInt(GetReturnValue(sgENPost, 0));
              ENBranch10Obj.postOutRef.code := postOutRefCode;


              if postOutRefCode <> low(Integer) then
                begin
                  tmpENPost := HTTPRIOENPost_s as ENPostControllerSoapPort;
                  postOutObj := tmpENPost.getObject(postOutRefCode);
                  try
                    if ENBranch10Obj.elementPostOutRef = nil then
                      ENBranch10Obj.elementPostOutRef := ENElementRef.Create;
                    ENBranch10Obj.elementPostOutRef.code :=
                      postOutObj.element.code;

                  finally
                    postOutObj.Free;
                    postOutObj := nil;
                  end;
                end; //if postOutRefCode <> low(Integer) then


              edtPostNumber.Text := 'Опора № ' + GetReturnValue(sgENPost, 3);
            except
               on EConvertError do Exit;
            end;
          end;
      end;
  finally
    frmENPostShow.Free;
  end;
end;

end.