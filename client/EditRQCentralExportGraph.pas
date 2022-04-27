
unit EditRQCentralExportGraph;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQCentralExportGraphController,
  TB2Item, TB2Dock, TB2Toolbar, AdvObj ;

type
  TfrmRQCentralExportGraphEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMonthGen : TLabel;
    lblYearGen : TLabel;


  HTTPRIORQCentralExportGraph: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtMonthGen: TComboBox;
    edtYearGen: TComboBox;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIORQCentralExportGraphType: THTTPRIO;
    lblCentralExportGraphType: TLabel;
    edtCentralExportGraphType: TEdit;
    spbCentralExportGraphType: TSpeedButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actDelete: TAction;
    actInsert: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    tbActions: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    sgRQCentralExportGraphItem: TAdvStringGrid;
    HTTPRIORQCentralExportGraphItem: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbCentralExportGraphTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQCentralExportGraphEdit: TfrmRQCentralExportGraphEdit;
  RQCentralExportGraphObj: RQCentralExportGraph;

implementation

uses ENDepartmentController, ShowENDepartment, ShowRQCentralExportGraphType,
  RQCentralExportGraphTypeController, EditRQCentralExportGraphItem,
  RQCentralExportGraphItemController;


{uses  
    EnergyproController, EnergyproController2, RQCentralExportGraphController  ;
}
{$R *.dfm}



procedure TfrmRQCentralExportGraphEdit.FormCreate(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);

end;

procedure TfrmRQCentralExportGraphEdit.FormShow(Sender: TObject);
    var
     TempENDepartment: ENDepartmentControllerSoapPort;
     TempRQCentralExportGraphType: RQCentralExportGraphTypeControllerSoapPort;

  TempItem: RQCentralExportGraphItemControllerSoapPort;
  z , x , i , LastCount  , LastRow : Integer;
  itList: RQCentralExportGraphItemShortList;
  itfilter : RQCentralExportGraphItemFilter;
begin
  TempItem :=  HTTPRIORQCentralExportGraphItem as RQCentralExportGraphItemControllerSoapPort;

  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
    DisableControls([spbDepartment , spbCentralExportGraphType]);
  end;

  if DialogState = dsView then
  begin
    DisableActions([actDelete , actInsert]);
  end;

  if DialogState <> dsInsert then
  begin
    DisableControls([edtMonthGen , edtYearGen  , spbDepartment , spbCentralExportGraphType]);
  end;

   if DialogState = dsInsert then
  begin
    DisableControls([edtCode , edtDepartment ,edtCentralExportGraphType]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMonthGen
      ,edtYearGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQCentralExportGraphObj.code);
      DisableControls([ edtDepartment ,edtCentralExportGraphType]);

    if ( RQCentralExportGraphObj.monthGen <> Low(Integer) ) then
      // edtMonthGen.Text := IntToStr(RQCentralExportGraphObj.monthGen)
      edtMonthGen.ItemIndex := RQCentralExportGraphObj.monthGen - 1
    else
     //  edtMonthGen.Text := '';
     edtMonthGen.ItemIndex := -1;

    if ( RQCentralExportGraphObj.yearGen <> Low(Integer) ) then
       // edtYearGen.Text := IntToStr(RQCentralExportGraphObj.yearGen)
       edtYearGen.ItemIndex := RQCentralExportGraphObj.yearGen - 2009
    else
       //edtYearGen.Text := '';
        edtYearGen.ItemIndex := -1;

    if RQCentralExportGraphObj.department <> nil then
        if RQCentralExportGraphObj.department.code <> low(Integer) then
        begin
          TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

          edtDepartment.Text := TempENDepartment.getObject(RQCentralExportGraphObj.department.code).shortName;
        end;

    if RQCentralExportGraphObj.exportGraphType <> nil then
        if RQCentralExportGraphObj.exportGraphType.code <> low(Integer) then
        begin
          TempRQCentralExportGraphType := HTTPRIORQCentralExportGraphType as RQCentralExportGraphTypeControllerSoapPort;

          edtCentralExportGraphType.Text := TempRQCentralExportGraphType.getObject(RQCentralExportGraphObj.exportGraphType.code).name;
        end;

       sgRQCentralExportGraphItem.Visible:= true;
       tbActions.Visible:= true;

       for z:=1 to sgRQCentralExportGraphItem.RowCount-1 do
        for x:=0 to sgRQCentralExportGraphItem.ColCount-1 do
          sgRQCentralExportGraphItem.Cells[x,z]:='';
      sgRQCentralExportGraphItem.RowCount := 2;


       itfilter := RQCentralExportGraphItemFilter.Create;
       SetNullIntProps(itfilter);
       SetNullXSProps(itfilter);

        itfilter.orderBySQL := 'dategen';

        itfilter.centralExportGraph := RQCentralExportGraphRef.Create;
        itfilter.centralExportGraph.code := RQCentralExportGraphObj.code;

        itList := TempItem.getScrollableFilteredList(itfilter,0,-1);


        LastCount:=High(itList.list);

        if LastCount > -1 then
           sgRQCentralExportGraphItem.RowCount:=LastCount+2
        else
           sgRQCentralExportGraphItem.RowCount:=2;

         with sgRQCentralExportGraphItem do
          for i:=0 to LastCount do
            begin
              Application.ProcessMessages;
              if itList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(itList.list[i].code)
              else
              Cells[0,i+1] := '';
              if itList.list[i].dateGen = nil then
                Cells[1,i+1] := ''
              else
                Cells[1,i+1] := XSDate2String(itList.list[i].dateGen);
              LastRow:=i+1;
              sgRQCentralExportGraphItem.RowCount:=LastRow+1;
            end;

         sgRQCentralExportGraphItem.Row:=1;



  end;
end;



procedure TfrmRQCentralExportGraphEdit.spbCentralExportGraphTypeClick(
  Sender: TObject);
var
   frmRqcentralgraphtype: TfrmRQCentralExportGraphTypeShow ;
   f : RQCentralExportGraphTypeFilter;
begin
   f := RQCentralExportGraphTypeFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmRqcentralgraphtype:=TfrmRQCentralExportGraphTypeShow.Create(Application,fmNormal, f);
   try
      with frmRqcentralgraphtype do begin
        if ShowModal = mrOk then
        begin
            try
               if RQCentralExportGraphObj.exportGraphType = nil then RQCentralExportGraphObj.exportGraphType := RQCentralExportGraphTypeRef.Create();
               RQCentralExportGraphObj.exportGraphType.code := StrToInt(GetReturnValue(sgRQCentralExportGraphType,0));
               edtCentralExportGraphType.Text:= GetReturnValue(sgRQCentralExportGraphType,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmRqcentralgraphtype.Free;
   end;

end;

procedure TfrmRQCentralExportGraphEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
       DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if RQCentralExportGraphObj.department = nil then RQCentralExportGraphObj.department := ENDepartmentRef.Create();
               RQCentralExportGraphObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmRQCentralExportGraphEdit.actDeleteExecute(Sender: TObject);
Var TempRQCentralExportGraphItem: RQCentralExportGraphItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQCentralExportGraphItem := HTTPRIORQCentralExportGraphItem as RQCentralExportGraphItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQCentralExportGraphItem.Cells[0,sgRQCentralExportGraphItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки графіку центровивозу матеріалів ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQCentralExportGraphItem.remove(ObjCode);
      FormShow(self);
  end;
end;

procedure TfrmRQCentralExportGraphEdit.actInsertExecute(Sender: TObject);
begin

  RQCentralExportGraphItemObj:=RQCentralExportGraphItem.Create;
  RQCentralExportGraphItemObj.centralExportGraph := RQCentralExportGraphRef.Create;
  RQCentralExportGraphItemObj.centralExportGraph.code := RQCentralExportGraphObj.code;
  try
    frmRQCentralExportGraphItemEdit:=TfrmRQCentralExportGraphItemEdit.Create(Application, dsInsert);
    try
      if frmRQCentralExportGraphItemEdit.ShowModal = mrOk then
      begin
        if RQCentralExportGraphItemObj<>nil then
            FormShow(self);
      end;
    finally
      frmRQCentralExportGraphItemEdit.Free;
      frmRQCentralExportGraphItemEdit:=nil;
    end;
  finally
    RQCentralExportGraphItemObj.Free;
  end;
end;

procedure TfrmRQCentralExportGraphEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQCentralExportGraph: RQCentralExportGraphControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMonthGen
      , edtYearGen
      , edtDepartment
      , edtCentralExportGraphType
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQCentralExportGraph := HTTPRIORQCentralExportGraph as RQCentralExportGraphControllerSoapPort;


    if (edtYearGen.ItemIndex >= 0) then
       RQCentralExportGraphObj.yearGen := edtYearGen.ItemIndex + 2009
     else
       RQCentralExportGraphObj.yearGen := Low(Integer) ;

     if (edtMonthGen.ItemIndex >= 0) then
       RQCentralExportGraphObj.monthGen := edtMonthGen.ItemIndex + 1
     else
       RQCentralExportGraphObj.monthGen := Low(Integer) ;


    if DialogState = dsInsert then
    begin
      RQCentralExportGraphObj.code:=low(Integer);
      TempRQCentralExportGraph.add(RQCentralExportGraphObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQCentralExportGraph.save(RQCentralExportGraphObj);
    end;
  end;
end;


end.